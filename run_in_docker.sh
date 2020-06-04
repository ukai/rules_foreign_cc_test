#!/bin/bash

docker build -t bazelisk dockerfiles/bazelisk

expected_user_entry="$(getent passwd "$USER")"
etc_passwd=/etc/passwd
docker_run_options=""

if grep -q "${expected_user_entry}" "${etc_passwd}"; then
  docker_run_options="-e USER=$(id -u -n) \
    -u=$(id -u) \
    -v ${etc_passwd}:${etc_passwd}"
else
  (cat /etc/passwd; echo "$(id -u -n):x:$(id -u):$(id -g)::/src/workspace:/bin/bash") > passwd
  docker_run_options="-e USER=$(id -u -n) \
    -u=$(id -u) \
    -v $(pwd)/passwd:${etc_passwd}"
fi

cmdline="$@"
echo "run ${cmdline} in docker..."

docker run ${docker_run_options} -v "$PWD:/src/workspace" \
  -w /src/workspace \
  bazelisk \
  /bin/bash -c "${cmdline}"
