Open Secure-K OS ThinClient
===========================

What is
^^^^^^^

    **Open Secure-K OS ThinClient** is the most secure encrypted thin client operating system for VDI and RDP. It's a live Linux-based operating system with kernel update and indestructible filesystem. 

    Unique system features are:

    * liveng compliancy: https://liveng.readthedocs.io;
    * encrypted data persistence;
    * **kernel update** (**on a ISO9660 filesystem**, which is the best option for a live operating system because of its strength against data corruption and tampering);
    * UEFI, with UEFI Secure Boot compatibility, with a real efi partition.


Screenshots
^^^^^^^^^^^

.. image:: open-securek-os-thin-horizon.png



For users
=========

Usage
^^^^^

    * Download the pre-built IMG image file from https://github.com/LumIT-Labs/thin-vdi/releases or build it yourself (see the For developers section). 
    * Write the image onto a USB key. See the section How to write below for more.
    * Open Secure-K OS ThinClient features a native encrypted data persistence, which is protected by a passphrase. If you opt for downloading the pre-built IMG image, the passphrase is hardwired and immutable (securek) and the filesystem space (encrypted partition) is limited in size.
    * Boot the live operating system and type in the decryption passphrase (securek). Open Secure-K OS ThinClient boots as any other Linux live operating system.
    * The VDI/RDP user is created upon the first boot. 
    * The administrative user is hidden from the login manager: login as securek, with password: securek in order to set up the system for the day-to-day usage. Use sudo for super-cow powers. Change the default password for security.


Programs
^^^^^^^^

Open Secure-k OS ThinClient comes with a bunch of RDP programs installed and it's ready for the installation of commercial VDI software. Because the best clients for VDI (Horizon / Citrix) are not open source and/or have a EULA users must accept, they must be installed manually. Fortunately this process is simple and straightforward. See the VDI software installation section below.


How to write
^^^^^^^^^^^^

Open Secure-K OS ThinClient can be deployed onto a USB key as any other Linux live operating system.

**Linux**
Linux users can make use of dd.
Run all the following commands as root or with sudo in a terminal emulator:

    * plug the USB key into your PC;
    * use fdisk -l for locating the device file, for example: /dev/sdx (change for your case);
    * it's better to unmount the auto-mounted devices, if any (umount /dev/sdxN);
    * finally write the image: dd if=path/to/imageFile.img of=/dev/sdx;
    * please note that dd always refers to the whole disk, so do not use /dev/sdx1 but /dev/sdx, as an example.

**Microsoft Windows**
Windows operating system's users can write the image by the use of Win32DiskImager (download from SourceForge: https://sourceforge.net/projects/win32diskimager) or Etcher (https://tails.boum.org/etcher/Etcher-Portable.exe).

Plug the USB key into your computer and launch Win32DiskImager/Etcher; now load the .img file image and write it to the key.

**Apple OS X**

Being a UNIX-like operating system, OS X users can make use of dd as the Linux people or they can use Etcher as the Windows ones, https://tails.boum.org/etcher/Etcher.dmg.

Plug the USB key into your computer and launch Etcher; now load the .img file image and write it to the key.


For developers
==============

Contribute to the project
^^^^^^^^^^^^^^^^^^^^^^^^^

Open Secure-K OS ThinClient is a **free and open source** project by LumIT Labs; code and documentation contributions are welcome.


How to build the initial ISO image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A **Debian Stretch** host is required for the build; other Debian-derived systems may also work.

The Open Secure-K OS ThinClient ISO image is built using the standard Debian **live-build** framework, so you first need to install it::
 
    apt-get install -y live-build

Git **clone this project as root**.

In order to build the image, open the terminal emulator **as root**::

    cd /path/to/thin-vdi/live-build
    bash lb

A .iso image will be built according to your host architecture (if building on an amd64, a 64bit iso will be produced; an i386 iso will be built on i386 hosts). Only the 64 bit system is really supported by LumIT Labs.


How to deploy
^^^^^^^^^^^^^

**Open Secure-K OS Deployer** (https://github.com/LumIT-Labs/open-securekos-deployer) is the deployment system for writing the initial Open Secure-K OS ThinClient ISO image onto a USB key - it will create the liveng partitioning scheme: run the Deployer, select the image you have built and type in a passphrase of your choice for LUKS-encrypting the data persistence partition (remember: Open Secure-K OS ThinClient features native encrypted persistence), then click on Write. Deployer will write the Open Secure-K OS ThinClient ISO image onto all the plugged-in (and listed) USB devices, thus creating the complete Open Secure-K OS ThinClient operating system.

Some Open Secure-K OS notes:

* use sudo for super-cow powers;
* during the boot, you will be asked for the decryption password of the data persistence partition - the secret you enter while deploying;
* system user will be created upon the first boot;
* [only for 32 bit builds] a GNOME Initial Setup bug triggers a crash if setting the network in the Initial Setup interface. In this case, just reboot the system.

 

VDI software installation
=========================

VMware Horizon::

	cd /path/to/file
	# /home/securek/Downloads for the English language desktops.

	bash VMware-Horizon-Client-5.0.0-12557422.x64.bundle 
	Extracting VMware Installer...done.
	You must accept the VMware Horizon Client End User License Agreement
	to continue.  Press Enter to proceed.

	[EULA]

	Do you agree? [yes/no]: yes

	Client Drive Redirection(The Client Drive Redirection component
	enables folder redirection from your local computer to the remote
	desktop.) [yes]: 

	Multimedia Redirection (MMR)(With multimedia redirection (MMR), the
	multimedia stream is processed on the client system.) [yes]: 

	Smart Card(The Smart Card component enables Smart Card device
	redirection from your local computer to the remote desktop.) [yes]: 

	Real-Time Audio-Video(The Real-Time Audio-Video component allows you
	to use local computer's webcam or microphone on the remote desktop.)
	[yes]: 

	VMware Horizon(R) Virtualization Pack for Skype for Business(VMware
	Horizon(R) Virtualization Pack for Skype for Business enables Skype
	for business on linux view client.) [yes]: 

	USB Redirection(The USB component enables USB device redirection from
	your local computer to the remote desktop.) [yes]: no

	SerialPort Redirection(The SerialPort Redirection component allows you
	to use local serialport devices from a remote desktop.) [yes]: 

	Virtual Printing(The Virtual Printing component allows you to use
	local or network printers from a remote desktop without requiring that
	additional print drivers be installed in the remote desktop.) [yes]: 

	Scanner Redirection(The Scanner Redirection component allows you to
	use local scanner devices from a remote desktop.) [yes]: 

	The product is ready to be installed:
		Virtual Printing
		SerialPort Redirection
		Client Drive Redirection
		Multimedia Redirection (MMR)
		Smart Card
		VMware Horizon(R) Virtualization Pack for Skype for Business
		Real-Time Audio-Video
		PCoIP
		Horizon Client
		Scanner Redirection
	Press Enter to begin installation or Ctrl-C to cancel.

	Installing VMware Horizon Client 5.0.0
	    Configuring...
	[######################################################################] 100%
	Installation was successful.
	Register and start installed services(s) after installation(Select
	yes, the Installer will create necessary entries in your system
	autostart or generate a launching script, so that the installed
	service(s) can be ready before the Horizon Client starts)[yes/no]: yes

	Do you want to check your system compatibilities for Horizon Client,
	this Scan will NOT collect any of your data?[yes/no]: no



