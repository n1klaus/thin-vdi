#!/bin/bash

USER_HOME=\$(eval echo ~\$USER)
touch \$USER_HOME/.local/share/applications/org.gnome.Terminal.desktop

exit 0
