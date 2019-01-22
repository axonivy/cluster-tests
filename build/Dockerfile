FROM maven:3.5.2-jdk-8

RUN addgroup --gid 1000 build && adduser --uid 1000 --gid 1000 --disabled-password --gecos "" build

# Install docker-ce
RUN apt-get update && \
  apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
  apt-get update && \
  apt-get -y install docker-ce && \
  usermod -aG docker $USER build