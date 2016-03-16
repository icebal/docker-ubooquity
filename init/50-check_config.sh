#!/bin/bash
chown -R abc:abc /app

if [ ! -f /app/ubooquity/preferences.xml ]; then
  echo "No config found, copys default now"
  cp -v /defaults/preferences.xml /config/ubooquity/preferences.xml
  echo "Changeing some defaults to match our container"
<<<<<<< HEAD
  chown abc:abc /config/ubooquity/preferences.xml
  chmod u+rw /config/ubooquity/preferences.xml
  chown -R abc:abc /config
=======
  chown abc:abc /app/ubooquity/preferences.xml
  chmod u+rw /app/ubooquity/preferences.xml
>>>>>>> f9f87780764c6ea350bc887ba11e7614405d3d82
fi
