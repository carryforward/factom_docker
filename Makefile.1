all: factom-base golang btcd factomd fctwallet

.PHONY: factom-base golang btcd factomd fctwallet run-golang run-btcd run-factomd run-fctwallet

factom-base:
	cd factom-base; docker build --no-cache -t factom-base .

golang: factom-base
	cd golang; docker build -t golang .

btcd: golang
	cd btcd; docker build -t btcd .

factomd: golang
	cd factomd; docker build -t factomd .

fctwallet: golang
	cd fctwallet; docker build -t fctwallet .

run-btcd:
	docker run -d -p 0.0.0.0:25:25 -p 0.0.0.0:587:587 -p 0.0.0.0:143:143 btcd

run-factomd:
	docker run -d -p 33100:33100 -v /factomd/.factomd factomd

run-fctwallet:
	docker run -d -p 0.0.0.0:80:80 -p 0.0.0.0:443:443 fctwallet

run-all: run-btcd run-factomd run-fctwallet

stop-btcd:
	docker stop `docker ps | grep btcd | awk "{print $1}"`

stop-factomd:
	docker stop `docker ps | grep factomd | awk "{print $1}"`

stop-fctwallet:
	docker stop `docker ps | grep fctwallet | awk "{print $1}"`

stop-all: stop-btcd stop-factomd stop-fctwallet
