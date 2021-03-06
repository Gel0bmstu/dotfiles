#!/usr/bin/env python

import subprocess
import requests
import os

# Varalbes
user = os.getenv('USER')

# Commands list
install_command = '/usr/bin/sudo apt-get install -y'.split()
update_command  = '/usr/bin/sudo apt-get update -y'.split()
upgrade_command = '/usr/bin/sudo apt-get upgrade -y'.split()

get_dotfiles_ssh   = 'git clone git@github.com:Gel0bmstu/dotfiles.git ~/dotfiles'.split()
get_dotfiles_https = 'git clone https://github.com/Gel0bmstu/dotfiles.git ~/dotfiles'.split()

get_dotfilest_list = '/bin/ls -a /home/{}/dotfiles'.format(user).split()
make_old_directory = '/bin/mkdir /home/{}/.old/'.format(user).split()
mv_old_file_to_dir = '/bin/mv {} /home/{}/.old/'
make_link_to_dotfile = '/bin/ln -s /home/{User}/dotfiles/{File} /home/{User}/{File}'

# ---------------------------------------------------------------------------------------------

# Install utiles
def install_utiles():

    utils = requests.get('http://35.228.159.44/index.php/s/rLpiLoTyRTgDyLn/download')
    # utils = open("utils.txt", "r").read().split('\n')

    subprocess.call(update_command)
    subprocess.call(upgrade_command)
    for u in utils.content.decode('UTF-8').split('\n'):
        if u[0] == '#' or u == '':
            continue

        print(u'\nTry to insatll {} ...'.format(u))
        subprocess.call(install_command + [u])

# Install enviroment
def install_env():
    subprocess.check_output(get_dotfiles_https)

    output = subprocess.check_output(get_dotfilest_list)
    files = output.decode('UTF-8').split()

    if not os.path.exists('/home/{}/.old'.format(user)):
        subprocess.check_output(make_old_directory) 

    for f in files:
        if f == '.' or f == '..' or f == '.git':
            continue

        if f[0] == '.':
            if os.path.exists('/home/{}/{}'.format(user, f)):
                subprocess.check_output(mv_old_file_to_dir.format(f, user).split())
            subprocess.check_output(make_link_to_dotfile.format(File=f, User=user).split())
