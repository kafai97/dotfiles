set -xuo

export PATH=$PATH:/usr/local/bin:$HOME/.local/bin

DOTFILES_DIR=$HOME/.dotfiles

git -C $DOTFILES_DIR/ pull

sh $DOTFILES_DIR/scripts/restore.sh

sh $DOTFILES_DIR/scripts/backup.sh

git -C $DOTFILES_DIR diff-index --quiet HEAD -- || (
  git -C $DOTFILES_DIR add .

  git -C $DOTFILES_DIR commit -m "regular update [$(gdate -u -Isecond)]"

  git -C $DOTFILES_DIR push
)
