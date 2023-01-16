# function _carapace_lazy {
#     source <(carapace $words[1] zsh)
# }
# compdef _carapace_lazy black carapace curl docker docker-compose go podman pip
source <(carapace black carapace curl docker docker-buildx docker-compose podman)
