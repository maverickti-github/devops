#!/bin/bash
#Script para Generar Imagenes Doccker con el comando "docker build"
#By Jonnathan López Moreno 
#Date 23Agosto2025

#Variables
DOCKERFILE=/var/lib/jenkins/workspace/devops/Dockerfile
REPOSITORY="srv03:5000"
APP="test"
#TAG=$((BUILD_TAG-3))


echo "******************"
echo "* Build Docker   *"
echo "******************"


docker build -f $DOCKERFILE -t $REPOSITORY/$APP:1.0 .
#Si falla la construcción
if [ $? -ne 0 ]; then
  echo "Se presenta Error en el comando docker build...."
  exit 1
fi





