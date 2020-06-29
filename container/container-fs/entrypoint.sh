#!/bin/bash -e

IOQ3_HOME="/opt/ioq3-linux-x86_64"
BASEQ3_OVERLAY_DIR="/baseq3-overlay"

if [ -d "${BASEQ3_OVERLAY_DIR}" ] && [ -n "$(ls -A ${BASEQ3_OVERLAY_DIR})" ]; then
  echo "Apply baseq3 overlay files"
  cp -r ${BASEQ3_OVERLAY_DIR}/* ${IOQ3_HOME}/baseq3 || exit ${E_INIT_CONFIG}
else
  echo "No files found in ${BASEQ3_OVERLAY_DIR}."
fi

exec ./ioq3ded.x86_64 "$@"
