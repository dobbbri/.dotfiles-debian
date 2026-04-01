#!/bin/bash

echo "run script manually one by one ------------------------------"
exit

fix_b43_wireless_driver_error() {
  # add contrib non-free to /etc/apt/sources.list
  sudo nvim /etc/apt/sources.list

  # add next 2 lines to file /etc/modprobe.d/local-b43.conf and save

  # Activate experimental support for some hardware revisions
  options b43 allhwsupport=1

  sudo nvim /etc/modprobe.d/local-b43.conf

  # run
  sudo rmmod b43
  sudo modprobe b43
  sudo apt install firmware-b43-installer
}

# https://askubuntu.com/questions/1250040/how-do-i-fix-mds-cpu-bug-present-and-smt-on-data-leak-possible-errors-from-lo
fix_mds_cpu_bug_present_and_smt_on_data_leak() {

  # Disables MDS mitigations completely.
  sudo -H nvim /etc/default/grub

  # Change:
  GRUB_CMDLINE_LINUX_DEFAULT="quiet"

  # To:
  GRUB_CMDLINE_LINUX_DEFAULT="quiet splash mds=full,nosmt"

  # Save the file and quit gedit.
  sudo update-grub

  # reboot
}

fix_xdg_desktop_portal_gtk_error() {
  # run
  sudo apt remove xdg-desktop-portal-gtk
}

fix_alsa_restore_std_boot_error() {
  # to fix in 90-alsa-restore.rules.in not found LABEL="alsa_restore_std":
  # in line 26, replace a label alsa_restore_go to alsa_restore_std
  # save and reboot'

  sudo vim /usr/lib/udev/rules.d/90-alsa-restore.rules
}
