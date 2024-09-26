parent_name ?= _PARENT-NAME
parent_groupId ?= _PARENT-GROUPID
parent_artifactId ?= _PARENT-ARTIFACTID
parent_version ?= _PARENT-VERSION
artifactId_d := $(subst -,_,$(parent_artifactId))
pom__macros := -D_GROUPID=$(parent_groupId) -D_NAME=$(parent_name) -D_VERSION=$(parent_version) -D_ARTIFACTID=$(parent_artifactId)
pom := pom.xml

all: $(pom) help
help:
	@echo "usage: $(MAKE) pom [parent_name=PROJECT] [parent_groupId=GROUP_ID] [parent_artifactId=ARTIFACT_ID] [parent_version=VERSION]"
	@echo "usage: $(MAKE) submodule [name=PROJECT] [groupId=GROUP_ID] [artifactId=ARTIFACT_ID] [version=VERSION]"
	@echo "usage: $(MAKE) check clean"

check: $(pom)
	mvn versions:display-plugin-updates
	mvn versions:display-dependency-updates

pom: $(pom)
$(pom): $(pom).m4 Makefile
	m4 $(pom_macros) $(pom).m4 | /usr/bin/xmllint --format --output $@ -

submodule: $(pom) $(name)/$(pom).m4
$(name)/$(pom).m4: $(pom).m4.submodule
	[[ "$(@D)" ]] && [[ "$(@D)" != /* ]]
	mkdir -p $(@D)/src/{main,test}/clojure
	cp -f Makefile.submodule $(@D)/Makefile
	m4 -D_PARENT_GROUPID=$(parent_groupId) -D_PARENT_NAME=$(parent_name) -D_PARENT_ARTIFACTID=$(parent_artifactId) \
	   -D_PARENT_VERSION=$(parent_version) -D_GROUPID=$(groupId) -D_NAME=$(name) -D_VERSION=$(version) \
	   -D_ARTIFACTID=$(artifactId) $< >$@
	cd $(@D) && make pom

.PHONY: all clean help pom submodule

# Local Variables:
# mode: makefile-gmake
# End:
