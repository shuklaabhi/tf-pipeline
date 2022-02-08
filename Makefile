TF_VERSION := 1.1.5

tf:
	docker run --rm -v $$(pwd):/workdir -v $$(pwd)/aws_profile.ini:/root/.aws/credentials -it hashicorp/terraform:$(TF_VERSION) -chdir=/workdir/infrastructure $(ARGS)

init:
	$(MAKE) tf ARGS=init

upgrade:
	$(MAKE) tf ARGS="init -upgrade=true"

plan: init
	$(MAKE) tf ARGS=plan

apply: init
	$(MAKE) tf ARGS=apply

state: init
	$(MAKE) tf ARGS=show

destroy: init
	$(MAKE) tf ARGS=destroy

