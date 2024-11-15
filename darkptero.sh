#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+]                Privateee                        [+]${NC}"
  echo -e "${BLUE}[+]                ©Rulz host                       [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e ""
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+]             Please Wait                         [+]${NC}"
  echo -e "                                                       "
  sudo apt install zip -y
  cd /var/www/pterodactyl
  wget https://github.com/khoirulhuda-cyber/mytmepnlrulz/blob/main/Tema%20Stellar.zip
  unzip -o "Tema Stellar.zip"
  cd
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C2.zip
  sudo rm -rf /root/pterodactyl
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+]              Done Abangkuh Supp Gw Ya                [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+]              GAGAL                              [+]${NC}"
    exit 1
 
  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
    x)
      echo "Keluar."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
