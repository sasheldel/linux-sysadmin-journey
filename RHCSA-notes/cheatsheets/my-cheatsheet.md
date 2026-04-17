# My RHCSA Cheat Sheet

## LVM
- `pvcreate /dev/sdb1` – create physical volume
- `vgcreate -s 8M vg_data /dev/sdb1` – VG with 8M extents
- `lvcreate -n lv_data -L 2G vg_data` – create 2GB LV
- `lvresize -r -L +500M /dev/vg_data/lv_data` – extend LV and filesystem

## Networking (nmcli)
- `nmcli con mod "Wired connection 1" ipv4.addresses "192.168.1.50/24" ipv4.method manual`
- `nmcli con up "Wired connection 1"`

## SELinux
- `semanage port -a -t http_port_t -p tcp 8080` – add port to SELinux
- `restorecon -Rv /web` – restore context
