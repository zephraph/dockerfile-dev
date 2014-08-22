## dockerfile-dev

This dockerfile is my personal developement setup

### Dependencies

* [dockerfile/python](http://dockerfile.github.io/#/python)

### Installation

1. Install [Docker](https://www.docker.io).
2. Pull down the latest version from the [Docker Registry](https://index.docker.io/): `docker pull zephraph/dev`
   (alternatively, you can build this image from its Dockerfile: `docker build -t="zephraph/dev" github.com/zephraph/dockerfile-dev`)

### Usage

    docker run -it --rm zephraph/dev
