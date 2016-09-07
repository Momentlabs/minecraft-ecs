login := $(shell aws --output text ecr get-login  --region us-east-1)
token := $(shell echo $(login)| awk '{print $$6}')
repo := minecraft-ecs

deploy-to-repo:
	@echo Bulding and pusing repository repository: $(repo)
	docker login -u AWS -p $(token) https://033441544097.dkr.ecr.us-east-1.amazonaws.com
	docker build -t $(repo) .
	docker tag $(repo):latest 033441544097.dkr.ecr.us-east-1.amazonaws.com/$(repo):latest
	docker push 033441544097.dkr.ecr.us-east-1.amazonaws.com/$(repo):latest