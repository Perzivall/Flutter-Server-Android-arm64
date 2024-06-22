#!/bin/bash

# Atualizar e instalar pacotes necessários no Termux
pkg update -y
pkg upgrade -y
pkg install proot-distro wget ncurses-utils -y

# Instalar Debian no proot
proot-distro install debian

# Ativar o wake lock do Termux
termux-wake-lock

# Entrar no ambiente Debian e executar o segundo script
proot-distro login debian --isolated -- bash -c "
  apt update -y && apt upgrade -y && apt install wget -y && cd /root/ &&
  wget https://raw.githubusercontent.com/Perzivall/Flutter-Web-Development-Environment-using-Android/main/auto_install_step_2.sh -O auto_install_step_2.sh &&
  chmod +x auto_install_step_2.sh
"

echo 'Finally, create start script'
read -p 'Enter a user: ' YOUR_USER
echo
read -p 'Enter a password: ' YOUR_PASSWORD
echo
echo "proot-distro login debian --isolated --user $YOUR_USER -- bash -c './start.sh && /bin/bash'" >> start.sh
echo
echo 'WARNING!'
echo 'Whenever you want to start Enviroment, type ./start.sh'
echo
chmod +x start.sh
