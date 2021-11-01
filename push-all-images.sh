#! /bin/bash

echo "push all images to registry.ncloud.navinfo.com/lbk"

registry="registry.ncloud.navinfo.com/lbk/"
images=$(docker images|grep -v "REPOSITORY"|grep -v "<none>"|awk '{print $1":"$2}')

for image in $images
do
    docker tag $image $registry$image
    docker push $registry$image
	echo "push the $registry$image succededly"
done

echo "pushed all the images succededly"

