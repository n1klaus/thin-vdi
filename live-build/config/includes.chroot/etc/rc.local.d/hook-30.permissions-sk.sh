#!/bin/bash
 
[ -f /bin/nc.traditional ] && chmod -v 750 /bin/nc.traditional 
[ `stat -c %G /bin/nc.traditional` != "nogroup" ] && chgrp nogroup /bin/nc.traditional
chmod -v 700 /usr/bin/cpp*
chmod -v 700 /usr/bin/gcc*
chmod -v 700 /bin/nc
chmod -v 700 /bin/netcat
chmod -v 700 /usr/bin/ncat
chmod -v 700 /usr/bin/X11/ncat
chmod -v 700 /usr/sbin/openconnect
chmod -v 700 /usr/sbin/openvpn
chmod -v 700 /bin/busybox
chmod -v 700 /bin/dd
chmod -v 700 /bin/vdir
chmod -v 700 /usr/bin/as
chmod -v 700 /usr/bin/ar
chmod -v 700 /usr/bin/c[89]9-gcc
chmod -v 700 /usr/bin/chsh
chmod -v 700 /usr/bin/cpan
chmod -v 700 /usr/bin/elfedit
chmod 750 /usr/bin/gnome-terminal
chown root:securek /usr/bin/gnome-terminal

exit 0
