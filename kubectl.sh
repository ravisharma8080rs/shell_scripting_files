sudo apt-get update -y
clear
sleep 2
count=$(apt list --installed | grep docker | wc -l)
if [ $count -eq 1 ]
then
	echo "Docker already installed !"
        docker --version
else
	echo "Docker installation has been start !"
	sleep 2
        sudo apt-get install docker.io -y
	sudo systemctl start docker
	sudo systemctl enable docker
	docker --version
fi
sudo docker info >> dockerinfo.txt
clear
echo "kubernets installation has been start !"
sleep 2
sudo apt-get install -y apt-transport-https ca-certificates curl
echo "Downloading the public signing key for the Kubernetes package repositories"
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.20/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y
sleep 2
kubeadm version --output=yaml >> kubeadminfo.txt
clear
sleep 2
echo "Installation of docker and kubernets has been completed !"
sleep 5
