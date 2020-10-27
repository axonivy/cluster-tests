def pullEngineImage() {
  sh 'docker pull axonivy/axonivy-engine:dev'
}

def start() {
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml up -d"
}

def stop() {
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml stop"
}

def down() {
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml down"
}

def waitUntilClusterIsUp() {
  waitUntilNodeIsUp('ivy1')
  waitUntilNodeIsUp('ivy2')
  waitUntilNodeIsUp('ivy3')
  waitUntilNodeIsUp('ivy4')
  waitUntilNodeIsUp('loadbalancer')
}

def waitUntilNodeIsUp(def host) {
  timeout(5) {
    waitUntil {
      def r = sh script: "wget -q http://${host}:8080/ivy/info/index.jsp -O /dev/null", returnStatus: true
      return (r == 0);
    }
  }
}

def logStatus(def name) {
  logApacheStatus(name)
  logIvyInfoPage(name)
  logClusterStatus(name)
}

def logApacheStatus(def name) {
  logPage('loadbalancer', '/server-status', "${name}-server-status")
  logPage('loadbalancer', '/balancer-manager', "${name}-balancer-manager")
}

def logIvyInfoPage(def name) {
  logPage('loadbalancer', '/ivy/info/index.jsp', "${name}-ivy-index")
}

def logClusterStatus(def name) {
  logPage('loadbalancer', '/ivy/info/index.jsp?pageId=cluster_panel', "${name}-cluster-status")
}

def logPage(def host, def uri, def name) {
  sh 'mkdir -p logs/pages'
  sh "wget -q http://${host}:8080${uri} -O logs/pages/${name}-${host}.html"
}

def collectDockerLogs() {
  collectDockerLog('db')
  collectDockerLog('loadbalancer')
  collectDockerLog('ivy1')
  collectDockerLog('ivy2')
  collectDockerLog('ivy3')
  collectDockerLog('ivy4')
}

def collectDockerLog(def name) {
  sh 'mkdir -p logs/'
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml logs ${name} > logs/docker-${name}.log"
}

return this
