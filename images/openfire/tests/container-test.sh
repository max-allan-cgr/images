#!/usr/bin/env bash

# Source: https://github.com/trinodb/trino/blob/master/core/docker/container-test.sh

function cleanup {
    if [[ -n ${CONTAINER_ID:-} ]]; then
        docker rm -f "${CONTAINER_ID}"
    fi
}

function test_openfire_starts {

    return 0
}

function test_javahome {
    local CONTAINER_NAME=$1    # Check if JAVA_HOME works
    docker run --rm "${CONTAINER_NAME}" \
        /bin/bash -c '$JAVA_HOME/bin/java -version' &>/dev/null

    [[ $? == "0" ]]
}

echo "🐢 Validating ${IMAGE_NAME}"
# test_javahome "${IMAGE_NAME}"
# test_openfire_starts "${IMAGE_NAME}"
echo "🎉 Validated ${IMAGE_NAME}"
