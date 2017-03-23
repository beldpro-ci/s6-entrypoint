IMAGE := s6test

run:
	docker run $(IMAGE)

build:
	docker build -t $(IMAGE) .


