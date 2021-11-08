dotfiles() {
    DOTFILES_DIR=$HOME/.dotfiles

    case "$1" in
    backup)
        sh $DOTFILES_DIR/scripts/backup.sh

        git -C $DOTFILES_DIR diff-index --quiet HEAD -- || (
            git -C $DOTFILES_DIR add .

            git -C $DOTFILES_DIR commit -m "regular update [$(gdate -u -Isecond)]"

            git -C $DOTFILES_DIR push
        )
        ;;
    restore)
        git -C $DOTFILES_DIR/ pull

        sh $DOTFILES_DIR/scripts/restore.sh
        ;;
    *)
        echo "Usage: (backup|restore)"
        ;;
    esac
}
