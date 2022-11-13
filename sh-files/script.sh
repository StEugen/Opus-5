#start of docker installation
sudo apt-get update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce
#end of docker installation
#
#start of portainer in docker installation
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
#end of portainer in docker installation
#
#start of jupyterhub installation
sudo apt update
sudo apt install -y python
sudo apt install -y npm nodejs
sudo apt install -y python3-pip
cd /
sudo python3 -m pip install jupyterhub
sudo npm install -g configurable-http-proxy
sudo python3 -m pip install notebook
#end of jupyterhub installation
#
