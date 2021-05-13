## Why do I exist?

For web-app development this is the basic working dockerized image to start from.

## How to run this?

### Install and get docker running

1. Install docker in Linux distro
1. Enable the docker service `sudo systemctl enable docker`
1. Start the docker service `sudo systemctl start docker`
1. Check that docker is runnin `sudo systemctl status docker`
1. Check running docker images `sudo docker ps -a`
1. Check that the docker folders have been created `ls -la /var/lib/docker/`
1. _OPTIONAL_ : Get the latest docker image for Ubuntu `sudo docker pull ubuntu:xenial`
1. Check that the default __bridge__ network is running `sudo docker network ls`

### Run docker to start the basic flask app

1. Create a test internal network `sudo docker network create -d bridge test.io`
1. Build docker image in root project `sudo docker build -t basic_flask:v1.0 -f Dockerfile .`
1. Run the docker image (as container) `sudo docker run -itd --rm=true --network=test.io -p 5001:5501 --name=basic_flask basic_flask:v1.0`
    - host computers port 5001 will have the app available
    - docker port 5501 is exposed as set in src/app.py
    - it will run in detached mode

## Handy docker commands

- View all containers `sudo docker ps -a`
- View all images `sudo docker images -a`
- Detete all running docker __images__ `sudo docker rmi $(docker images -aq)`
- Delete all running docker __containers__ `sudo docker rm -f $(docker ps -aq)`
- General docker cleanup `sudo docker system prune`
- One line clear and re-build `docker rm -f $(docker ps -aq) ; docker system prune ; docker network create -d bridge test.io ; docker build -t basic_flask:v1.0 -f Dockerfile . ; docker run -itd --rm=true --network=test.io -p 5001:5501 --name=basic_flask basic_flask:v1.0`
