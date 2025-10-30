SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"
cd $SCRIPT_DIR
git add . && git commit -m 'update' && git push origin main
say "Vocab deployment successful."
