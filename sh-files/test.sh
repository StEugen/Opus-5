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
