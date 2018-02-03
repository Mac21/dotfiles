# Link .config and .x files to ~


# Enable XDM service
`systemctl enable xdm-archlinux.service`


# Locale
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf


# Network
Create interface file in /etc/netctl/interface for wireless/ethernet

enable iflugd systemd-unit
`systemctl enable netctl-ifplugd@interface.service`
