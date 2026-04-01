#!/bin/bash

echo "run script manually one by one ------------------------------"
exit

nmtui_not_detecting_my_wifi_adapter() {
  # https://www.reddit.com/r/debian/comments/13vpu3d/nmtuinncli_not_detecting_my_wifi_adapter_realtek/

  # edit /etc/NetworkManager/NetworkManager.conf,
  # change managed=false to true,
  # and restart computer

  sudo nvim /etc/NetworkManager/NetworkManager.conf
}
