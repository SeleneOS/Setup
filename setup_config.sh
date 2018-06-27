echo "Installing system files"
sudo cp -r etc/* /etc

echo "Creating home directories"
mkdir -p ~/testing ~/downloads ~/repos/$USER ~/documents ~/music ~/pictures/screenshots ~/videos ~/.seleneos_data

echo "Creating temporary folder /tmp/selene_setup"
mkdir -p /tmp/selene_setup && cd /tmp/selene_setup
echo "Downloading dotfiles_setup"
git clone https://github.com/SeleneOS/dotfiles_setup.git
echo "Copying files to home directory"
cp -rf dotfiles_setup/* ~
cp -rf dotfiles_setup/.* ~
rm -rf ~/.git ~/README.md

if [[ -d ~/.seleneos ]]; then
    mv ~/.seleneos ~/.seleneos_old
fi
git clone https://github.com/SeleneOS/dotfiles_setup.git ~/.seleneos

if [[ -f /etc/pacman.conf ]]; then
    echo "Adding some color to pacman"
    sudo sed -i "/#Color/c\Color" /etc/pacman.conf
fi

echo "Disabling password for sudo"
sudo sed -i "/# %wheel ALL=(ALL) NOPASSWD: ALL/c\%wheel ALL=(ALL) NOPASSWD: ALL" /etc/sudoers

if ! grep -q seleneos "/home/$USER/.bash_profile"; then
    echo "Adding bash_profile"
    echo -e "\n# Selene OS\n[[ -f ~/.seleneos/.bash_profile ]] && . ~/.seleneos/.bash_profile" >> ~/.bash_profile
fi
if ! grep -q seleneos "/home/$USER/.bashrc"; then
    echo "Adding bashrc"
    echo -e "\n# Selene OS\n[[ -f ~/.seleneos/.bashrc ]] && . ~/.seleneos/.bashrc" >> ~/.bashrc
fi


echo -e "\n\nSetup finished! Press Control+D to logout or reboot, then login again!\n"
