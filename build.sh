#! /bin/sh

docker build -t actstech/rcouch .
container_id=$(docker run -d actstech/rcouch 2>&1)
docker cp $container_id:/rcouch/rel/rcouch `pwd`
docker stop $container_id
docker rm $container_id
cd dist
tar -zcvf rcouch.tar.gz rcouch
rm -rf rcouch
