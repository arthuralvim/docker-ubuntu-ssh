docker-ubuntu-ssh
=================

A docker image for Ubuntu:latest + SSH.

Download
========

To push the image from the docker repository.

    docker push arthuralvim/docker-ubuntu-ssh
 
or to push the image from github.
 
    docker build -t "arthuralvim/docker-ubuntu-ssh" github.com/arthuralvim/docker-ubuntu-ssh

Run
===

For running this image you just need to:

    docker run -d -p 2222:22 arthuralvim/docker-ubuntu-ssh

After that you can ssh into it:

    ssh root@127.0.0.1 -p 2222 (password="root")
