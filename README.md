# My Dockers
My most used dockerfiles collected together
## Building
simply build (and push to registry `tfwnicholson`) by running
`make`
## Using
Run a container using, e.g.
`docker run --rm  -it -w /app -v ~/.gitconfig:/etc/gitconfig -v $(pwd):/app -v ~/.ssh:/tmp/.ssh:ro tfwnicholson/cpp`
