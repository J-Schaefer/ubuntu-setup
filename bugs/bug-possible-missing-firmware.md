# Possible missing firmware

```bash
$ sudo apt full-upgrade
Possible missing firmware /lib/firmware/rtl_nic/rtl8125a-3.fw for module r8169
```

This error might also be connected to system freezes, although that is not confirmed.

There might already be a file called `/lib/firmware/rtl_nic/rtl8125a-3.fw`, which might be corrupted or something.
So replacing it with the correct one, can fix the issue.

```bash
git clone git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
sudo cp -r linux-firmware/rtl_nic/ /lib/firmware/
sudo update-initramfs -u
rm -rf linux-firmware
```
