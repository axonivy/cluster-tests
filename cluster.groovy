def pullEngineImage() {
  sh 'docker pull axonivy/axonivy-engine:dev'
}

def start(def nodes) {
  services = "db loadbalancer"
  for (node = 1; node <= nodes; node++)
  {
    services += " ivy"+node
  }
  sh "cp docker-ivy-cluster/apache-conf/${nodes}-members.conf docker-ivy-cluster/apache-conf/members.conf"
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml up -d $services"
}

def stop() {
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml stop"
}

def down() {
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml down -v --rmi local"
}

def waitUntilClusterIsUp(def nodes) {
  for (node = 1; node <= nodes; node++)
  {
    waitUntilNodeIsUp('ivy'+node)
  }
  waitUntilNodeIsUp('loadbalancer')
}

def waitUntilNodeIsUp(def host) {
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
  logPage(host, '/ivy/system/info.jsp', nodes, "${name}-info-page")
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
  sh "docker-compose -f docker-ivy-cluster/docker-compose.yml logs ${name} > nodes${nodes}/docker-${name}.log"
}

return this
