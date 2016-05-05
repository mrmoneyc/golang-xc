Golang with Cross Compilation Toolchains
=============

Usage
-------------
```
$ docker run -it --rm -v $PWD:/go/src/my_project mrmoneyc/golang-xc "go build -v /go/src/my_project/main.go"
$ docker run -it --rm -v $PWD:/go/src/my_project -e PROJECT_SRC=my_project mrmoneyc/golang-xc "go build -v"
$ docker run -it --rm -v $PWD:/go/src/my_project -e CC=arm-linux-gnueabi-gcc -e CGO_ENABLED=1 -e GOOS=linux -e GOARCH=arm mrmoneyc/golang-xc "go build -v /go/src/my_project/main.go"
```
