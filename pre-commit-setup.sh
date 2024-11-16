#!/bin/bash
set -e
echo "Installing pre-commit package"
pip3 install pre-commit==3.8.0

# create symbolic link ./dbt/profiles.yml
if [[ -f ~/.dbt/profiles.yml ]]; then
    [[ ! -a ./dbt/profiles.yml ]] && ln -s ~/.dbt/profiles.yml ./dbt/profiles.yml
else
    echo "~/.dbt/profiles.yml is missing."
fi

pre-commit install --hook-type commit-msg --hook-type pre-commit && echo -e "\nSuccessfully installed pre-commit hooks !!"
