all: factom_base factom_golang factom_factomd
# fctwallet

.PHONY: factom_base factom_golang factom_factomd run-factom_factomd
# factom_fctwallet
# run-factom_fctwallet

factom_base:
	docker build -t factom_base -f Dockerfile_base .

factom_golang: factom_base
	docker build -t factom_golang -f Dockerfile_golang .

factom_factomd: factom_golang
	docker build -t factom_factomd -f Dockerfile_factomd .

# factom_fctwallet: factom_golang
	# docker build -t fctwallet -f Dockerfile_fctwallet .

run-factomd:
	if [ -z "`docker ps -a | grep factom-data`" ]; then docker run --name factom-data -v /factom/.factom busybox true && docker cp factomd.conf factom-data:/factom/.factom && docker run --rm --volumes-from factom-data -v /factom/.factom -u root factom_factomd chown factom:factom /factom/.factom; else docker start factom-data; fi
	docker run --rm --volumes-from factom-data --volume /factom/.factom --publish 0.0.0.0:8088:8088 --publish 0.0.0.0:8108:8108 factom_factomd

# run-fctwallet:
	# docker run -d -p 0.0.0.0:80:80 -p 0.0.0.0:443:443 factom_fctwallet

run-all: run-factomd
# run-fctwallet

stop-factomd:
	docker ps
	docker stop `docker ps | grep factom_factomd | awk '{print ${1}}'`

# stop-fctwallet:
	# docker stop `docker ps | grep factom_fctwallet | awk "{print $1}"`

stop-all: stop-factomd
# stop-fctwallet
