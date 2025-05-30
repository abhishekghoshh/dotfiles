


# single line git push
function push() {
  if [ -z "$1" ]; then
    git push
  else
    git add . && git commit -m "$1" && git push
  fi
}

# single line git pull
function pull(){
    git pull
}

# single line git pull and rebase
function rebase(){
    git pull --rebase
}