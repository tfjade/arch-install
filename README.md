# arch-install
Arch Linux installer with following features:

* ext4 or BTRFS with subvolumes
* Optional encryption of the whole filesystem
* All [official Arch Linux kernels](https://wiki.archlinux.org/title/Kernel) supported
* Boot loader options:
   * Grub
   * systemd-boot
   * rEFInd
   * EFISTUB
* Secure boot (experimental)
* AppArmor
* Optionally systemd-homed
* Many desktops and window managers
* and many more options.

## Usage
To use this Arch Linux installer, download the official [archlinux iso](https://archlinux.org/download/).
After booting from that image, first, and only if needed, set your keymap, like
e.g. `loadkeys fi` for finnish. Next download this installer:

```
git clone https://github.com/tfjade/arch-install.git
```
You'll find all options in the base config file `arch-install/arch-install.conf`.
Either edit the base config `arch-install/arch-install.conf`, or create your own
custom conf file. At least you'll want to set the **KEYMAP** and **LOCALE**
variables, unless you are in the US.

For example, to create your custom.conf:

```
nano custom.conf
```
Use **nano** or **vim**. Being in Finland, here's the bare minimum what I would
always set:

```
KEYMAP=fi
LOCALE=fi_FI
```
Save and exit.
You now have your own `custom.conf` file.

Now you are ready to start the installer. It just must be executable, so run:

```
chmod +x arch-install/arch-install
```
 
You may want to check the options of the installer first

```
arch-install/arch-install -h
```
If needed, press Q to quit the pager.

To start the installer with your own config file, run:

```
arch-install/arch-install -i custom.conf
```
