#!/bin/sh

ROOT_DIR=$(dirname "$(realpath "$0")")
TAG=$(basename "${ROOT_DIR}")

UNAME=$(id -un)
UID=$(id -u)
GID=$(id -g)

if [ ! -f "${ROOT_DIR}/Dockerfile" ]; then
	echo "Error: Dockerfile not found in ${ROOT_DIR}"
	exit 1
fi

if [ ! -d "${ROOT_DIR}/env" ]; then
	echo "Error: 'env' directory not found in ${ROOT_DIR}"
	exit 1
fi

echo "Building Docker image with tag: ${TAG}-image"
if ! docker build \
	--build-arg gid="${GID}" \
	--build-arg uid="${UID}" \
	--build-arg uname="${UNAME}" \
	-t "${TAG}-image" \
	"${ROOT_DIR}"; then
	echo "Error: Docker build failed."
	exit 1
fi

echo "Running Docker container with tag: ${TAG}"
if ! docker run \
	-h "${TAG}-host" \
	-it \
	--name "${TAG}-box" \
	--rm \
	-v "${ROOT_DIR}/env:${HOME}/${TAG}" \
	"${TAG}-image"; then
	echo "Error: Docker run failed."
	exit 1
fi

echo "Docker build and run completed successfully."
exit 0
