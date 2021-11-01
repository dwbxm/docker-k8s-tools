yum -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
yum install -y epel-release yum-utils device-mapper-persistent-data lvm2
yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum -y install docker-ce docker-ce-cli containerd.io
mkdir /etc/docker
cat>/etc/docker/daemon.json<<EOF
{
  "graph":"/home/docker",
  "registry-mirrors": [ "https://docker.mirrors.ustc.edu.cn",
                        "https://reg-mirror.qiniu.com",
                        "https://hub-mirror.c.163.com"]
}
EOF
systemctl daemon-reload
systemctl start docker
systemctl enable docker
docker version

