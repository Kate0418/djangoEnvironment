ifeq (app,$(firstword $(MAKECMDGOALS)))
  APP_NAME := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  $(eval $(APP_NAME):;@:)
endif
ifndef APP_NAME
  $(error アプリ名を設定してください)
endif
app:
	@docker build --build-arg APP_NAME=$(APP_NAME) -t django_environment .
	@docker run -d --name django_environment django_environment
	@docker cp django_environment:/workdir/$(APP_NAME) ./$(APP_NAME)
	@docker stop django_environment
	@docker rm django_environment