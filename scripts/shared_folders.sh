# Quick script to setup a samba server for file sharing
docker run -v ~/:/data --name data dockerfile/ubuntu
docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba data
