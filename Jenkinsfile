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
          stash name: 'test-project', includes: '**/target/*.iar'
          archiveArtifacts '**/target/*.iar'
        }
      }
    }

    stage('test-performance') {
      steps {
        script {

          unstash 'test-project'

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
              cluster.start()
              cluster.waitUntilClusterIsUp()
              cluster.logStatus('after-start')
              dir ('test-cluster-performance') {
                maven cmd: "clean verify -Djmeter.server=loadbalancer -Djmeter.port=8080"
              }
            } finally {             
                try {
                  cluster.logStatus('before-stop')
                  cluster.stop()
                } finally {
                  cluster.collectDockerLogs()
                  cluster.down()
                  archiveArtifacts 'logs/**, */target/jmeter/reports/'
                  createPerformanceReport()
                }
            }
          }
          sh 'docker network rm ivycluster'
        }
      }
    }
  }
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
    sourceDataFiles: '*/target/jmeter/results/*.csv'
}
