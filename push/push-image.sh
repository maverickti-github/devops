#!/bin/bash
#Script para subir la imagen al Registry Nexus "nexus-server:5000"
#By Jonnathan López Moreno 
#Date 23Agosto2025

#Variables
REPOSITORY="srv03:5000"
APP="test"


#Docker Login Nexus Docker Registry
echo "*** Loggin Nexus ***"
docker login -u $NEXUS_REGISTRY -p $NEXUS_REGISTRY $REPOSITORY
#docker login -u dockeradmin -p $NEXUS_REGISTRY $REPOSITORY

echo "******************"
echo "* Pushing Image  *"
echo "******************"

docker push $REPOSITORY/$APP:1.0
#Si falla la construcción
if [ $? -ne 0 ]; then
  echo "Se presenta Error en el comando docker push...."
  exit 1
fi





