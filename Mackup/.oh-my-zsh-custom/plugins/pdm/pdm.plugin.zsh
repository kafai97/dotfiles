if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH="$HOME/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582":$PYTHONPATH
else
    export PYTHONPATH="$HOME/.local/pipx/venvs/pdm/lib/python3.9/site-packages/pdm/pep582"
fi
