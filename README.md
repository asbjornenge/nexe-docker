# Nexe Docker

Builds a [docker](http://docker.io) container for building binary [nodejs](http://nodejs.org) applications using [nexe](https://github.com/crcn/nexe).

Example usage:

	docker run -i -t -v $(pwd):/app -w /app asbjornenge/nexe-docker -i index.js -o app.bin

enjoy.