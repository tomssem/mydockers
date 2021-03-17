SHELL:=/bin/bash
REGISTRY?=tfwnicholson
DOCKERFILES=$(shell find * -type f -name Dockerfile)
IMAGES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))
DEPENDS=.depends.mk
NPROC:=$(shell grep -c ^processor /proc/cpuinfo)

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
	docker build --build-arg NPROC=$(NPROC) -t $(REGISTRY)/$@ $(subst :,/,$@)
	docker push $(REGISTRY)/$@
#	if docker build --build-arg NPROC=$(NPROC) -t $(REGISTRY)/$@ $(subst :,/,$@)\
#			| grep "^Step [0-9][0-9]*/[0-9][0-9]* :" -A1 --no-group-separator\
#			| grep -v "^Step [0-9][0-9]*/[0-9][0-9]* :"\
#			| grep "^ ---> Running";\
#	then\
#		docker push $(REGISTRY)/$@;\
#	else\
#		echo "No work done not pushing to registry";\
#	fi

