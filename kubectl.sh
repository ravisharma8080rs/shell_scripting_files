sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y
kubectl version --short
kubeadm version --output=yaml
clear
sleep 10
count=$(apt list --installed | grep docker | wc -l)
if [ $count -eq 1 ]
then
        docker --version
else
        sudo apt-get install docker.io -y
	sudo systemctl start docker
	sudo systemctl enable docker
	docker --version
fi
sudo docker info

