#!/bin/bash

USER_HOME=\$(eval echo ~\$USER)
touch \$USER_HOME/.local/share/applications/org.gnome.Terminal.desktop
touch \$USER_HOME/.local/share/applications/firefox-esr.desktop

exit 0
