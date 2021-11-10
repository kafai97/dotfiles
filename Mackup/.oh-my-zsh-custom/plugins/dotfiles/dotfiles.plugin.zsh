dotfiles() {
    DOTFILES_DIR=$HOME/.dotfiles

    case "$1" in
    backup)
        sh $DOTFILES_DIR/scripts/backup.sh
        ;;
    restore)
        sh $DOTFILES_DIR/scripts/restore.sh
        ;;
    *)
        echo "Usage: (backup|restore)"
        ;;
    esac
}
