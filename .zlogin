# shellcheck disable=all
if (($+PAI_CONTAINER_ID)) && [[ -d /output && $USER == wzy ]]; then
	sudo chown $USER /output
fi
