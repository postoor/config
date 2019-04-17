#!/bin/bash
INSTALL_ENV='dev'
BASEDIR=$(dirname $0)

echo "Install at Product? (Y/n)"
read yn
case $yn in
    [Yy]* ) INSTALL_ENV='prod';;
    * )
esac

sudo apt update

# Set Timezone at Asia/Taipei
sudo timedatectl set-timezone Asia/Taipei
sudo apt install ntpdate -y
sudo ntpdate time.stdtime.gov.tw

if [ $INSTALL_ENV -eq 'dev' ]; then
    INSTALL_ZSH='Y'
    echo "Install ZSH? (Y/n)"
    read INSTALL_ZSH
    case $INSTALL_ZSH in
        [Nn]* ) 
            ;;
        *)
            # Install ZSH
            sudo apt install -y zsh
            # Install Oh-my-zsh
            sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
            # Copy zsh config
            cp $BASEDIR/$INSTALL_ENV/.zsh* ~/
            ;;
    esac
fi

# Copy bash config
cp $BASEDIR/$INSTALL_ENV/.bash* ~/
exit 0