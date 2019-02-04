def pullEngineImage() {
  sh 'docker pull axonivy/axonivy-engine:dev'
}

def start() {
  sh "docker-compose -f build/docker-ivy-cluster/docker-compose.yml up -d"
}

def stop() {
  sh "docker-compose -f build/docker-ivy-cluster/docker-compose.yml stop"
}

def down() {
  sh "docker-compose -f build/docker-ivy-cluster/docker-compose.yml down"
}

def waitUntiClusterIsUp() {
  waitUntilPortIsUp(9080)
  waitUntilPortIsUp(9081)
  waitUntilPortIsUp(9082)
  waitUntilPortIsUp(9083)
  waitUntilPortIsUp(9084)
}

def waitUntilPortIsUp(def port) {
  timeout(1) {
    waitUntil {
      def r = sh script: "wget -q http://${env.NODE_NAME}:${port}/ivy/info/index.jsp -O /dev/null", returnStatus: true
      return (r == 0);
    }
  }
}

def logStatus(def name) {
  logApacheStatus(name)
  logClusterStatus(name)
}

def logApacheStatus(def name) {
  logPage(9080, '/server-status', "${name}-server-status")
  logPage(9080, '/balancer-manager', "${name}-balancer-manager")
}

def logClusterStatus(def name) {
  logPage(9080, '/ivy/info/index.jsp?pageId=cluster_panel', "${name}-cluster-status")
}

def logPage(def port, def uri, def name) {
  sh 'mkdir -p logs/pages'
  sh "wget -q http://${env.NODE_NAME}:${port}${uri} -O logs/pages/${name}-${port}.html"
}

def collectDockerLogs() {
  collectDockerLog('ivy1')
  collectDockerLog('ivy2')
  collectDockerLog('ivy3')
  collectDockerLog('ivy4')
}

def collectDockerLog(def name) {
  sh 'mkdir -p logs/'
  sh "docker-compose -f build/docker-ivy-cluster/docker-compose.yml logs ${name} >> logs/docker-${name}.log"
}

return this
