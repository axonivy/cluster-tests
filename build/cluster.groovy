def pullEngineImage() {
  sh 'docker pull axonivy/axonivy-engine:nightly-13.1'
}

def start(def nodes) {
  services = "db loadbalancer"
  for (node = 1; node <= nodes; node++)
  {
    services += " ivy"+node
  }
  sh "cp docker-ivy-cluster/apache-conf/${nodes}-members.conf docker-ivy-cluster/apache-conf/members.conf"
  sh "docker compose -f docker-ivy-cluster/compose.yml up -d $services"
}

def stop() {
  sh "docker compose -f docker-ivy-cluster/compose.yml stop"
}

def stopNode(def node) {
  sh "docker compose -f docker-ivy-cluster/compose.yml stop ivy${node}"
}

def startNode(def node) {
  sh "docker compose -f docker-ivy-cluster/compose.yml start ivy${node}"
}

def down() {
  sh "docker compose -f docker-ivy-cluster/compose.yml down -v --rmi local"
}

def waitUntilClusterIsUp(def nodes) {
  for (node = 1; node <= nodes; node++) {
    waitUntilNodeIsUp(node)
  }
  waitUntilHostIsUp('loadbalancer')
}

def waitUntilNodeIsUp(def node) {
  waitUntilHostIsUp('ivy'+node)
}

def waitUntilHostIsUp(def host) {
  timeout(5) {
    waitUntil {
      def r = sh script: "wget -q http://${host}:8080/ivy/system -O /dev/null", returnStatus: true
      return (r == 0);
    }
  }
}

def logStatus(def nodes, def name) {
  logApacheStatus(nodes, name)
  for (node = 1; node <= nodes; node++)
  {
    logIvyInfoPage('ivy'+node, nodes, name)
  }
}

def logApacheStatus(def nodes, def name) {
  logPage('loadbalancer', '/server-status', nodes, "${name}-server-status")
  logPage('loadbalancer', '/balancer-manager', nodes, "${name}-balancer-manager")
}

def logIvyInfoPage(def host, def nodes, def name) {
  logPage(host, '/ivy/system/engine-cockpit/faces/info.xhtml', nodes, "${name}-info-page")
}

def logPage(def host, def uri, def nodes, def name) {
  sh "mkdir -p nodes${nodes}"
  sh "wget -q http://${host}:8080${uri} -O nodes${nodes}/${name}-${host}.html"
}

def collectDockerLogs(def nodes) {
  collectDockerLog('db', nodes)
  collectDockerLog('loadbalancer', nodes)
  for (node = 1; node <= nodes; node++)
  {
    collectDockerLog('ivy'+node, nodes)
  }
}

def collectDockerLog(def name, def nodes) {
  sh "mkdir -p nodes${nodes}"
  sh "docker compose -f docker-ivy-cluster/compose.yml logs ${name} > nodes${nodes}/docker-${name}.log"
}

def createPerformanceReport() {
  perfReport errorUnstableThreshold: 1,
    modeOfThreshold: true,
    ignoreFailedBuilds: true,
    configType: 'PRT',

    // display diagram,
    excludeResponseTime: true,  // Exclude response time of errored samples
    modeThroughput: true,
                    
    persistConstraintLog: true,
    sourceDataFiles: 'results/**/*.csv'
}

def createPerformancePlot()
{
  writePlotsData();
  archiveArtifacts artifacts: 'results/*.csv', onlyIfSuccessful: true
  createPlots()
}

def writePlotsData()
{
  unarchive mapping: ["standardResults.xml" : "standardResults.xml"]
  def standardResults = readFile("standardResults.xml")
  def plots = readStandardResults(standardResults)
  plots.each{ entry -> writeCSV file: "results/"+entry.key+".csv", records: entry.value }
}

@NonCPS 
def readStandardResults(def standardResults)
{
  def plots = [:]
  def results = new XmlParser().parseText(standardResults)
  results.children().each { api ->
    def httpCode = api.get("httpCode")
    if (httpCode.text() == "200")
    {
      def uri = api.get("uri").text()
      def name = uri.substring(0, uri.lastIndexOf(" "))
      def nodes = uri.substring(uri.lastIndexOf(" "), uri.length())
      def average = api.get("average").text()
      def records = plots[name]
      if (records == null)
      {
          records = [[], []]
          plots[name] = records            
      }
      if (! records[0].contains(nodes))
      {
         records[0].add(nodes);
         records[1].add(average);
      }
    }
    else if (currentBuild.resultIsBetterOrEqualTo("SUCCESS"))
    {
      unstable("There are errors in the http responses") 
    }
  }
  return plots;
}

def createPlots()
{
  def files = findFiles(glob: 'results/*.csv')
  files.each{ file -> 
    def name = file.name.replace(".csv", "")
    plot csvFileName: "plot-response-time-${name}.csv", 
         csvSeries: [[displayTableFlag: false, exclusionValues: '', file: file.toString(), inclusionFlag: 'OFF', url: '']], 
         group: 'Response Times', 
         numBuilds: '100', 
         style: 'line', 
         title: name, 
         useDescr: true, 
         yaxis: 'Response Time [ms]'
  } 
}

return this
