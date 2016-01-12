# Adapted from
# https://github.com/binder-project/example-dockerfile/blob/master/Dockerfile

FROM andrewosh/binder-base

MAINTAINER Aditya Mahajan

USER root

# Add Julia dependencies
RUN apt-get update
RUN apt-get install -y julia && apt-get clean

USER main

# Install Julia kernel
RUN julia -e 'Pkg.add("IJulia")'
RUN julia -e 'Pkg.add("Gadfly")' && julia -e 'Pkg.add("Interact")'
