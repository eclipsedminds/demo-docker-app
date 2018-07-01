#!/bin/sh

if [ ! -d node_modules ]; then
    echo "Running npm install"
    docker run --rm \
        -v $(pwd):/usr/src/demo-docker-app.dev \
        -w /usr/src/demo-docker-app.dev \
        eclipsedminds/demo-docker-app \
        sh -c 'npm install'
fi

echo "Starting the app"
docker run -it --rm \
    -p 8080:8080 \
    -v $(pwd):/usr/src/demo-docker-app.dev \
    -w /usr/src/demo-docker-app.dev \
    eclipsedminds/demo-docker-app \
    sh -c 'npm start'
