all: factom_base factom_golang factom_factomd
# btcd fctwallet

.PHONY: factom_base factom_golang factom_factomd run-factom_factomd
# factom_fctwallet factom_btcd
# run-factom_fctwallet run-factom_btcd

factom_base:
	# cd factom_base; docker build --no-cache -t factom_base .
	docker build -t factom_base -f Dockerfile_base .

factom_golang: factom_base
	docker build -t factom_golang -f Dockerfile_golang .

# factom_btcd: factom_golang
	# docker build -t factom_btcd -f Dockerfile_btcd .

factom_factomd: factom_golang
	docker build -t factom_factomd -f Dockerfile_factomd .

# factom_fctwallet: factom_golang
	# docker build -t fctwallet -f Dockerfile_fctwallet .

# run-btcd:
	# docker run -d -p 0.0.0.0:25:25 -p 0.0.0.0:587:587 -p 0.0.0.0:143:143 factom_btcd

run-factomd:
	docker run -d -p 127.0.0.1:8384:8384 -p 0.0.0.0:8108:8108 -v /factomd factom_factomd
	# docker run -d -p 127.0.0.1:8384:8384 -p 0.0.0.0:8108:8108 factom_factomd

# run-fctwallet:
	# docker run -d -p 0.0.0.0:80:80 -p 0.0.0.0:443:443 factom_fctwallet

run-all: run-factomd
# run-fctwallet run-btcd

stop-factomd:
	docker stop `docker ps | grep factom_factomd | awk "{print $1}"`

# stop-fctwallet:
	# docker stop `docker ps | grep factom_fctwallet | awk "{print $1}"`

# stop-btcd:
	# docker stop `docker ps | grep factom_btcd | awk "{print $1}"`

stop-all: stop-factomd
# stop-fctwallet stop-btcd
