FROM minecraft-no-tools

MAINTAINER David Rivas david@momentlabs.io

# Clearly this needs to be done as a separate download.
# However,this expediency is going to be taken to enable 
# a slightly less complex development pipeline.
# get the latest craft-config.
# RUN mkdir -p /go/src
# ENV GOPATH=/go

# ecs-pilot which has the aws library we need.
# RUN git clone https://github.com/jdrivas/ecs-pilot.git /go/src/ecs-pilot
# WORKDIR /go/src/ecs-pilot
# RUN go get ./...
# RUN go install

# tool for managing server archives etc.
# RUN git clone https://github.com/jdrivas/craft-config.git /go/src/craft-config
# WORKDIR /go/src/craft-config
# RUN go get ./...
# RUN go install
# RUN cp /go/bin/craft-config /usr/local/bin
ADD https://github.com/Momentlabs/craft-config/releases/download/v0.0.1/craft-config_linux_amd64 /usr/local/bin/craft-config
RUN chmod a+rx /usr/local/bin/craft-config

# This needs to be set to a username for things to work properly. 
# It's intended to be a valid minecraft user, but there is currently
# nothing that actually requires that, so any string will do. 
# It is currently used as the root of storage for worlds and backups.
ENV USER=


# This is what the parent expects.
WORKDIR /data
