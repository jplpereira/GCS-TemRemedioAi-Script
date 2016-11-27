#!/bin/bash
#Definindo a cor amarela
YELLOW='\033[1;33m'
#Definindo a falta de cor
NOCOLOR='\033[0m'
#Consultando a versão do sistema
VERSION=`uname -m`
#Definindo a versão desejada 
TARGET_VERSION="x86_64"
#Definindo o caminho da pasta de projetos do Android Studio
PROJECTS_FOLDER="/home/$USER/AndroidStudioProjects"
#Definindo o endereço do repositório remoto do projeto no GitHub
PROJECT_REPO="https://github.com/jplpereira/GCS-TemRemedioAi.git"

echo -e "${YELLOW}#################################################################################################################"
echo "Iniciando a instalação do projeto TemRemedioAi"
echo "Adicionando repositórios"
sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:paolorotolo/android-studio
sudo apt-get update
echo "Instalando o Java Development Kit"
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
echo "Instalando o Android Studio"
sudo apt-get install android-studio
#Instalando bibliotecas adicionais caso a versão do sistema seja de 64 bits
if [ "${VERSION}" == "${TARGET_VERSION}" ]; then
echo "Seu sistema é de 64 bits. Será necessário instalar algumas bibliotecas"
echo "Instalando bibliotecas"
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
else
echo "Seu sistema é de 32 bits. Não será necessário instalar outras bibliotecas"
fi
echo "Criando a pasta de projetos do Android Studio"
sudo mkdir $PROJECTS_FOLDER
echo "Clonando o projeto do GitHub"
cd $PROJECTS_FOLDER
sudo git clone $PROJECT_REPO
echo "Criando atalho para o desktop"
echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Android Studio\nExec='/opt/android-studio/bin/studio.sh' %f\nIcon=/opt/android-studio/bin/studio.png\nCategories=Development;IDE;\nTerminal=false\nStartupNotify=true\nStartupWMClass=android-studio" >> ~/.local/share/applications/androidstudio.desktop
echo "Inicializando o Android Studio"
./opt/android-studio/bin/studio.sh
echo -e "#################################################################################################################${NOCOLOR}"
