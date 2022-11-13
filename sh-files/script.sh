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
