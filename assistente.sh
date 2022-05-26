#!/bin/bash

sudo passwd ubuntu

echo \"Iniciando atualização dos pacotes...\"
sudo apt update && sudo apt upgrade -y

echo \"Baixando Java 11\"
sudo apt install default-jre
sudo apt install openjdk-11-jre-headlwss

docker --version
if [ $? -eq 0 ]
then
echo \"Docker já instalado!\"
else
echo \"Docker não instalado, gostaria de instalar? [s/n~]?\"
read inst
if [ \"$inst\" == \"s\" ]
then
echo \"Iniciando instalação do docker...\"
sudo apt install docker.io -y
echo \"Verificando imagem MySql\"
sudo docker images | grep mysql
if [ $? -eq 0 ]
then
echo \"MySql instalado\"
else
echo \"MySql não instalado, instalando...\"
sudo docker pull mysql:5.7
echo \"Iniciando docker.\"
sleep 3
sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=4four" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
fi
else
echo \"Você escolheu não instalar o docker\"
fi
fi


cat > Dockerfile <<EOF
FROM openjdk:11
WORKDIR /javaCli/
COPY /executable_quatro.jar/ /javaCli/
CMD ["java","-jar","executable_quatro.jar"]
EOF

sudo docker build . -t executable_quatro-jar

sudo docker run -it executable_quatro-jar
