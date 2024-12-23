#!/bin/bash

BASE="https://raw.githubusercontent.com/BlackIceCrypto/BlackIceGuides/refs/heads/main/base.sh"
source <(curl -s $BASE)
bold=$(tput bold)
normal=$(tput sgr0)

logo

#ssh PUBLICK key
PUB_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA31pHiLWoOEBMKIBbpNkYtlcFPJ0v/8CTl0JcWgS6gcj1lgVcbQEImKyoXOqFeJthpdI8/GnP4Fr6WIFQ/PUGOsMQRig3qAUBpch6tDd/v3KxAUtRdauHBxojsYAM7FTjRsxI/G3N10BDlxhFvbl3MKfY7kfUgddgMftfeNptvLEnJfTLFaN61Ky+hJooRG7gXq+EIb5Eia4JVGBjuCVs5kEjwQtqhUKkVfGBIy85ufNJqZL91f0+miBl6QCg5LHDPdvLtixXLzb40tgk16gp8x2RdgXjEq3PQdFclqrkYbXF3o9IM8tQbwW/8noXCa/8RUtfxGR5Iv9dqUAGzYcZ2w== rsa-key-20241222"

#PATH to files
ssh_config_dir="/etc/ssh"
ssh_key_dir="~/.ssh"
auth_keys="$ssh_key_dir/authorized_keys"

ssh_setup(){
    #Create ssh directory
    mkdir -p $ssh_key_dir

    # write your key to authorized_keys file
    echo $PUB_KEY > $auth_keys

    # Set permissions
    sudo chmod 700 $ssh_key_dir
    sudo chmod 600 $auth_keys

    #Disable password login
    sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' $ssh_config_dir/sshd_config
    sudo sed -i 's/PermitRootLogin yes/PermitRootLogin prohibit-password/' $ssh_config_dir/sshd_config
    sudo sed -i 's/#   PasswordAuthentication yes/   PasswordAuthentication no/' $ssh_config_dir/ssh_config

    header "Please restart your server to apply the changes!"
}

ssh_setup
