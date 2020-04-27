# multi-docker

aws.json

## HOSTNAME

-> hostname is optional
-> it is to identify the container uniquely
-> should be same as nginx default.conf

## LINKS

-> To tells the communication between container
-> e.g. nginx ---> client
-> nginx ---> server
-> Link array should contain the name of container (not hostname)

## ESSENTIAL

-> One of the essential flag sould be true
-> If the container flag set as true fails, all other container will fail

## KUBERNETES

## apiVersion

    - each api version defines a different set of 'objects' we can use like V1 defines
        - componentStatus    -Event
        - configMap          -Namespace
        - Endpoints          -Pod

## Imperative command to update image

    kubectl set image <object type>/<object name> <container name>=<new image to use>
    - eg : kubectl set image deployment/client-deployment client=hakunamatata007/multi-client:v1

    image : we want to change the image
    object type : type of object like pod, deployemnt, service
    object name : inside <object_type> yaml file metadata name
    container name: inside <object_type> yaml file name of the container we want to update

## local docker to minikube docker

    eval $(minkube docker-env)

## remove node cache

    docker system prune -a
