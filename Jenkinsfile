pipeline {
  agent {
    label 'performance-test'
  }

  triggers {
    pollSCM '@hourly'
    cron '@midnight'
  }

  parameters {
    string(
      name: 'engineSource',
      description: 'Engine page url',
      defaultValue: 'https://jenkins.ivyteam.io/job/ivy-core_product/job/master/lastSuccessfulBuild/'
    )
  }

  options {
    buildDiscarder logRotator(artifactNumToKeepStr: '10', numToKeepStr: '180')
    disableConcurrentBuilds()
  }

  stages {
    stage('build') {
      steps {
        script {
          docker.build('maven-build', '.').inside {
            dir ('test-app') {
              maven cmd: "clean verify -Dengine.page.url=${params.engineSource}"            
            }
          }
          archiveArtifacts '**/target/deploy/*.zip'
          docker.build('axonivy-engine-cluster-test', '-f docker-ivy-cluster/Dockerfile .')
        }
      }
    }

    stage('test-performance') {
      steps {
        script {
          try {
            for(nodes=4; nodes > 0; nodes--)
            {
              testWithNodes(nodes);
            }
          } finally {
            archiveArtifacts 'nodes*/**'
            createPerformanceReport()
            createPerformancePlot()
          }
        } 
      }
    }
  }
}

def testWithNodes(def nodes)
{
  try {
    sh 'docker network create ivycluster'
  } catch (Exception ex) {
    // it may already exist 
  }

  docker.build('maven-build', '.')
        .inside('--network=ivycluster -v /var/run/docker.sock:/var/run/docker.sock --group-add docker --sysctl net.ipv4.tcp_tw_reuse=1') { container -> 
    def cluster = load 'cluster.groovy'
    try {
      cluster.down()
      cluster.start(nodes)
      cluster.waitUntilClusterIsUp(nodes)
      cluster.logStatus(nodes, 'after-start')
      dir ('test-cluster-performance') {
        maven cmd: "clean verify -Djmeter.server=loadbalancer -Djmeter.port=8080 -Djmeter.nodes=$nodes"
      }
    } finally {             
      try {
        cluster.logStatus(nodes, 'before-stop')
        cluster.stop()
      } finally {
        cluster.collectDockerLogs(nodes)
        cluster.down()
      }
    }    
  }
  sh 'docker network rm ivycluster'
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
