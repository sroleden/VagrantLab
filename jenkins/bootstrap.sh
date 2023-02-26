
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
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld

sudo firewall-cmd --permanent --zone=public --add-port=8081/tcp
sudo firewall-cmd --permanent --zone=public --add-port=8082/tcp
sudo firewall-cmd --permanent --add-service=http

sudo firewall-cmd --list-ports
sudo firewall-cmd --list-services

sudo firewall-cmd --reload


sudo firewall-cmd --permanent --new-service=jenkins

sudo firewall-cmd --permanent --service=jenkins --set-short="Jenkins Service Ports"

sudo firewall-cmd --permanent --service=jenkins --set-description="Jenkins service firewalld port exceptions"

sudo firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
sudo firewall-cmd --permanent --service=jenkins --add-port=40683/tcp

sudo firewall-cmd --permanent --add-service=jenkins
sudo firewall-cmd --permanent --add-service=telnet

sudo firewall-cmd --zone=public --add-service=http --permanent

sudo firewall-cmd --reload

sudo firewall-cmd --list-all
