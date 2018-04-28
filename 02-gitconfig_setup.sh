#!/bin/bash

USERNAME=USERNAME GOES HERE
USER_EMAIL=EMAIL GOES HERE

git config --global user.name "$USERNAME"
git config --global user.email "$USER_EMAIL"
ssh-keygen -t rsa -C "$USER_EMAIL"


echo ""
echo "Copy the content of id_rsa.pub into your account on GitHub under SSH keys"
read -p "Press [Enter] key to continue..."
ssh -T git@github.com


echo ""
echo "Copy the same content of id_rsa.pub into your account on GitLab under SSH keys"
read -p "Press [Enter] key to continue..."
ssh -T git@gitlab.com


echo ""
echo "Running part 3 of the setup automation..."
source ./03-environment_setup.sh

