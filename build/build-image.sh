#!/bin/bash
#Script para Generar Imagenes Doccker con el comando "docker build"
#By Jonnathan López Moreno 
#Date 14Septiembre2025

#Variables
DOCKERFILE=/var/lib/jenkins/workspace/jenkins-docker-nexus-kubernetes/Dockerfile
REPOSITORY="srv03:5000"
APP="test"

echo "******************"
echo "* Build Docker   *"
echo "******************"


docker build -f $DOCKERFILE -t $REPOSITORY/$APP:1.0 .
#Si falla la construcción
if [ $? -ne 0 ]; then
  echo "Se presenta Error en el comando docker build...."
  exit 1
fi





