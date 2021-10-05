BINARY=build

build:
	docker build -t ghcr.io/jiramot/mysqldump .

run:
	docker run -it --rm -v ${PWD}/dump:/dump -e DBSERVER=127.0.0.1 -e DATABASE=test -e USER=root -e PASS=root ghcr.io/jiramot/mysqldump

.PHONY: build