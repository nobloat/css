#!/bin/bash 

docker build -f Dockerfile.ruler --target ruler-dev -t nobloat/css:ruler-dev .
docker build -f Dockerfile.ruler -t nobloat/css:ruler-prod .
docker history --human=false --format="{{.CreatedBy}}\t{{.Size}}" ruler-dev
docker history --human=false --format="{{.CreatedBy}}\t{{.Size}}" ruler-prod

docker push nobloat/css:ruler-dev
docker push nobloat/css:ruler-prod