sudo yum install java-11-openjdk-devel -y

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

cat /etc/yum.repos.d/jenkins.repo

sudo yum install jenkins -y

sudo systemctl start jenkins
sudo systemctl enable jenkins

sudo systemctl status firewalld
sudo systemctl enable firewalld

sudo systemctl unmask --now firewalld
sudo systemctl start firewalld

sudo firewall-cmd --permanent --zone=public --add-port=8081/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8082/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8071/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8072/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8081/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8082/tcp

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=jenkins
sudo firewall-cmd --permanent --add-service=telnet

sudo firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
sudo firewall-cmd --permanent --service=jenkins --add-port=40683/tcp

sudo firewall-cmd --reload