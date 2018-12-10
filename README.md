# youtube-dl

Dockerized command-line program to download videos from YouTube.com and other video sites http://rg3.github.io/youtube-dl/

### Local runtime/binary

If you want to be able to run  ```youtube-dl``` as if it was installed on your host locally, you can define the following function in your ```~/.bashrc```, ```~/.zshrc``` or similar:

```
youtube-dl() {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/downloads \
        eedev/youtube-dl "$@"
}
```
