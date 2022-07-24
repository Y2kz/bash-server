echo "installing Figlet"
#for debian based (modify here for other base distro)
sudo apt install figlet -y
echo "Settting scripts executable"
chmod +x get_content.sh 
chmod +x server.sh

echo "Finished Setup"
echo "Run server.sh now"
