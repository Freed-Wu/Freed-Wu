# shellcheck disable=all
if (($+PAI_CONTAINER_SSH_PORT)); then
  echo $PAI_CONTAINER_SSH_PORT
fi
