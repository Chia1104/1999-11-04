#!/usr/bin/env sh

_() {
  echo "When you born(yyyy-mm-dd): "
  read -r BORN
  echo "GitHub Username: "
  read -r USERNAME
  echo "Your email: "
  read -r EMAIL
  echo "GitHub Access token: "
  read -r ACCESS_TOKEN

  [ -z "$BORN" ] && exit 1
  [ -z "$USERNAME" ] && exit 1
  [ -z "$EMAIL" ] && exit 1
  [ -z "$ACCESS_TOKEN" ] && exit 1  

  git config --global user.email ${EMAIL}
  git config --global user.name ${USERNAME}
  git init
  git add .
  GIT_AUTHOR_DATE="${BORN}T18:00:00" \
    GIT_COMMITTER_DATE="${BORN}T18:00:00" \
    git commit -m "${BORN}"
  git remote add origin "https://${ACCESS_TOKEN}@github.com/${USERNAME}/${BORN}.git"
  git branch -M main
  git push -u origin main -f
  echo
  echo "Cool, check your profile now: https://github.com/${USERNAME}"
} && _

unset -f _