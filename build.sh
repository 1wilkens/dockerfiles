#!/bin/bash

set -e

REPOSITORY="1wilkens"

# lazy way to add timestamps to the output
echo() {
    command echo "$(date)" "$@"
}

# Iterate images
for image in */; do
    # Strip directory suffix
    image=${image%/}
    repo_image="${REPOSITORY}/${image}"
    cd ${image}
    echo "# Building ${repo_image} images"

    # Iterate (alpine) versions
    for version in */; do
        # Strip directory suffix
        version=${version%/}
        cd ${version}

        # Assemble tag string
        tag="${version}"
        echo "## Building tag: ${repo_image}:${tag}"

        # Build the tag
        docker buildx build --pull --no-cache -t "${repo_image}:${tag}" .

        # (Optionally) push the tag
        if [[ "$1" == "push" ]]; then
            echo "## Pushing ${repo_image}:${tag}"
            docker push "${repo_image}:${tag}"
        fi

        # Reset to parent directory
        cd ..
    done

    # Reset to parent directory
    cd ..
done
