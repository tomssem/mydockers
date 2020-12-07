REGISTRY?=registry
DOCKERFILES=$(shell find * -type f -name Dockerfile)
IMAGES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
DEPENDS=.depends.mk
GIT_EMAIL = $(shell git config --global --get user.email)
GIT_NAME = "$(shell git config --global --get user.name)"
.PHONY: all clean $(IMAGES)
all: $(IMAGES)
clean:
	rm -f $(DEPENDS)
$(DEPENDS): $(DOCKERFILES) Makefile
	grep '^FROM $(REGISTRY)/' $(DOCKERFILES) | \
	awk -F '/Dockerfile:FROM $(REGISTRY)/' '{ print $$1 " " $$2 }' | \
	sed 's@[:/]@\\:@g' | awk '{ print $$1 ": " $$2 }' > $@
sinclude $(DEPENDS)
$(IMAGES): %:
	docker build --build-arg GIT_NAME=$(GIT_NAME) --build-arg GIT_EMAIL=$(GIT_EMAIL) -t $(REGISTRY)/$@ $(subst :,/,$@)
