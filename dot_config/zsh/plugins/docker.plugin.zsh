alias dk="docker"
alias ldk="DOCKER_HOST=$(docker context inspect | jq -r '.[0].Endpoints.docker.Host') lazydocker"
