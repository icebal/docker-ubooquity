#!/bin/bash
chown -R abc:abc /app

if [ ! -f /app/ubooquity/preferences.xml ]; then
  echo "No config found, copys default now"
  cp -v /defaults/preferences.xml /app/ubooquity/preferences.xml
  echo "Changeing some defaults to match our container"
  chown abc:abc /app/ubooquity/preferences.xml
  chmod u+rw /app/ubooquity/preferences.xml
fi
