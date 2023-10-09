cdpath=(
  $HOME/dev
)

export AWS_PROFILE=beg-edx-shared-dev
echo "Setting AWS_PROFILE=${AWS_PROFILE}"

FILE="${HOME}/.rd/docker.sock"
if [ -S "$FILE" ]; then
  export DOCKER_HOST=unix://$FILE
  echo "Export DOCKER_HOST=${DOCKER_HOST}"
fi