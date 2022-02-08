TF_VERSION := 1.1.5

tf:
	docker run --rm -v $$(pwd):/workdir -it hashicorp/terraform:$(TF_VERSION) -chdir=/workdir/infrastructure $(ARGS)

init:
	$(MAKE) tf ARGS=init

plan: init
	$(MAKE) tf ARGS=plan

apply: init
	$(MAKE) tf ARGS=apply

