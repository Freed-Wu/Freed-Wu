#!/usr/bin/env zsh
(($+commands[gopass])) && PASS=gopass || PASS=pass
# https://github.com/Kaggle/kaggle-api/issues/446
echo "export KAGGLE_USERNAME='$($PASS show kaggle/username)'
export KAGGLE_KEY='$($PASS show kaggle/key)'
export OPENAI_API_KEY='$($PASS show openai/api_key)'" > pass.sh
echo "CODESTATS_API_KEY='$($PASS show codestats/$HOST)'" > codestats.sh
echo echo "'$($PASS show wakatime/api_key)'" > wakatime.sh
chmod +x wakatime.sh
