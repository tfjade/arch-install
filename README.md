# Arch-install
Arch Linux installer with following features:

* ext4 or BTRFS with subvolumes
* Optional encryption of the whole filesystem
* All [official Arch Linux kernels](https://wiki.archlinux.org/title/Kernel) are supported
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
e.g. `loadkeys fi` for finnish. Next, download this installer:

```bash
pacman-key --init archlinux && pacman -Sy --needed git
git clone https://github.com/tfjade/arch-install.git
```

The first line just ensures **git** is installed.

You'll find all the options for *arch-install* in the base config file `arch-install/arch-install.conf`.
At least you'll want to set the **KEYMAP** and **LOCALE**
variables, unless you are in the US.

There are many optional ways how you can set values to variables. You may even combine any of the following options with another.

### Option 1 - the base config file arch-install.conf
Edit the base config file using **nano** or **vim**, like:

```bash
nano arch-install/arch-install.conf
```

and set all the variables you want. I encourage you to read through
this file at least once to familiarize yourself with all the options.

After editing the base config file, start the installer simply by running it:

```bash
arch-install/arch-install
```

You may of course add some cli options if needed.  
To see all the cli options, use the `-h`/`--help` option:

```bash
arch-install/arch-install --help
```

Press Q to quit the pager.

### Option 2 - custom config file
Create your own custom.conf, where you can set the variables you want, like:

```bash
nano custom.conf
```

Use **nano** or **vim**. Being in Finland, here's the bare minimum what I would always set:

```bash
KEYMAP=fi
LOCALE=fi_FI
```

Save and exit.
You now have your own `custom.conf` file.

Start the installer with your own config file using the `-i`/`--conf` option, like:

```bash
arch-install/arch-install -i custom.conf
```

### Option 3 - the command line
Use the command line to set some variables using the `-o`/`--option` cli option. You don't need to edit any files, when you use this method for setting the variables as you start the installer.

To set those **KEYMAP** and **LOCALE** variables, start the installer like:

```bash
arch-install/arch-install -o KEYMAP=fi,LOCALE=fi_FI
```

Of course you may add to the list what ever variables you want to set, or options you want to enable or disable.