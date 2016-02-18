# factom_docker

* To build the base images for docker:
```make all```

* To run docker_factomd
```make run-factomd```

* To stop docker_factomd
```make stop-factomd```

OR...

```docker-compose up```

* Example of the run command:
```docker run --name factomd --rm -p 127.0.0.1:8384:8384 -p 0.0.0.0:8108:8108 -v /factomd/.factom factom_factomd```
