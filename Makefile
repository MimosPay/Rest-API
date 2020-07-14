run_slate:
	echo "Run Slate at http://localhost:4567 ..."
	#docker run -d --rm --name slate -p 4567:4567 -v $(CURDIR)/build:/srv/slate/build -v $(CURDIR)/source:/srv/slate/source slate
	docker run -d --rm --name slate -p 4567:4567 -v $(CURDIR)/build:/srv/slate/build -v $(CURDIR)/source:/srv/slate/source -v $(CURDIR)/lib:/srv/slate/lib slate

stop_slate:
	echo "Stop Slate..."
	docker stop slate

build_slate:
	echo "Build Slate..."
	docker exec -it slate /bin/bash -c "bundle exec middleman build"

logging_slate:
	echo "View Slate log..."
	docker logs -f slate

convert_swagger_to_slate:
	widdershins --search true --expandBody true --language_tabs 'shell:cURL' 'javascript--node:NodeJS' 'go:Go' 'python:Python' 'java:Java' --summary $(CURDIR)/spec/mimos_pay.json -o $(CURDIR)/spec/mimos_pay.md

build_docker_image:
	docker build . -t slate
