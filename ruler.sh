#!/bin/bash 

docker build -f Dockerfile.ruler --target ruler-dev -t ruler-dev . > /dev/null
DEVSIZE=$(docker inspect ruler-dev | jq '.[0].Size')
OSSIZE=$(docker inspect alpine |jq '.[0].Size')

docker history --format="{{.CreatedBy}} --> {{.Size}}" ruler-dev | grep -v '#(nop)\|0B$'

echo "RULER-OS-SIZE: $OSSIZE"
echo "RULER-DEV-SIZE: $(expr $DEVSIZE - $OSSIZE)"

docker build -f Dockerfile.ruler -t ruler-run . > /dev/null
RUNSIZE=$(docker inspect ruler-run | jq '.[0].Size')
echo "RULER-RUN-SIZE: $RUNSIZE"

docker history --format="{{.CreatedBy}} --> {{.Size}}" ruler-run | grep -v '#(nop)\|0B$'


echo "RULER-LINES-DOC: $(cat README.md index.html example/*.html | wc -l)"
echo "RULER-BYTES-DOC: $(cat README.md index.html example/*.html | wc -c)"
echo "RULER-LINES-FUNC: $(cat src/*.css | wc -l)"
echo "RULER-BYTES-FUNC: $(cat src/*.css | wc -c)"
echo "RULER-LINES-TEST: 0"
