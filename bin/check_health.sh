#!/bin/sh

if [[ -z "${SECURE_USERNAME}" ]]; then
  exec curl --fail http://localhost:3000/environments
else
  exec curl --user $SECURE_USERNAME:$SECURE_PASSWORD --fail http://localhost:3000/environments
fi
