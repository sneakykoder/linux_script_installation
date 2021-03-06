#!/bin/bash
echo "---   Mint 18 installation."
clear
./generic/install_update.sh
./generic/install_basic.sh
./ubuntu/install_complementary_ubuntu_16_04.sh
./install_development.sh
./install_google_chrome.sh
./install_opera.sh
./install_google_remote_desktop.sh
./install_google_talk_plugin.sh
./install_google_music_manager.sh
./install_sublime_text.sh
./mint/install_insync_client_mint18.sh
./ubuntu/install_owncloud_client_ubuntu_1604.sh
./ubuntu/install_virtualbox_ubuntu_1604.sh
./install_hipchat.sh
./ubuntu/install_dropbox_ubuntu.sh
./install_pencil_project.sh
./install_atom_io.sh
./install_remarkable.sh
./install_vscode.sh
./ubuntu/install_nodejs_ubuntu_1604.sh
