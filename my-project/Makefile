# Use bash
SHELL := /bin/bash

# Update project information in Makefile.conf.m4 file
-include Makefile.conf

super_name ?= SUPER_NAME
super_groupId ?= SUPER_GROUPID
super_artifactId ?= SUPER_ARTIFACTID
super_version ?= SUPER_VERSION

groupId ?= $(super_groupId)
artifactId ?=
name ?= $(artifactId)
version  ?= 0.0.1-alpha

pom_macros := -D_GROUPID=$(super_groupId) -D_NAME=$(super_name) -D_VERSION=$(super_version) -D_ARTIFACTID=$(super_artifactId)
pom := pom.xml
conf := Makefile.conf

mvn := mvn
export MAVEN_OPTS := -Djansi.force=true -Dstyle.color=always

all:
	@echo "Usage: $(MAKE) pom check compile test package install clean"
	@echo "usage: $(MAKE) config super_name=PROJECT super_groupId=GROUP_ID super_artifactId=ARTIFACT_ID super_version=VERSION"
	@echo "usage: $(MAKE) submodule artifactId=ARTIFACT_ID [name=PROJECT] [groupId=GROUP_ID] [version=VERSION]"

check: $(pom)
	mvn versions:display-plugin-updates
	mvn versions:display-dependency-updates

pom: $(pom).m4
	m4 $(pom_macros) $< | xmllint --format --output $(pom) -

$(pom): $(pom).m4 $(conf)
	m4 $(pom_macros) $< | xmllint --format --output $(pom) -

compile test package install: $(pom)
	$(mvn) $@

config: $(conf).m4
	m4 $(pom_macros) $(conf).m4 | tee $(conf)

$(conf): $(conf).m4 Makefile
	m4 $(pom_macros) $(conf).m4 > $(conf)

submodule: $(pom) $(name)/$(pom).m4
$(name)/$(pom).m4: # should not depends on anything to avoid overwriting
	[[ "$(@D)" ]] && [[ "$(@D)" != /* ]]
	mkdir -p $(@D)/src/{main,test}/clojure/$(subst -,_,$(groupId)/$(artifactId))
	cp -f Makefile.submodule $(@D)/Makefile
	cp -f macros.m4 $(@D)/macros.m4
	m4 -D_SUPER_GROUPID=$(super_groupId) -D_SUPER_NAME=$(super_name) -D_SUPER_ARTIFACTID=$(super_artifactId) \
	   -D_SUPER_VERSION=$(super_version) -D_GROUPID=$(groupId) -D_NAME=$(name) -D_ARTIFACTID=$(artifactId) \
	   -D_VERSION=$(version) $(pom).m4.submodule | xmllint --format --output $@ -
	printf "%s\n" "# -*- mode: Makefile -*-" "groupId ?= $(groupId)" "artifactId ?= $(artifactId)" "name ?= $(name)" "version ?= $(version)" > $(name)/Makefile.conf
	cd $(@D) && $(MAKE) pom
	@# Add submodule in super
	$(MAKE) --always-make $(pom)

clean:
	-rm -f *~ *.log

distclean: clean
	-rm -f $(pom) $(conf)

.PHONY: all clean config distclean help pom submodule

# Local Variables:
# mode: makefile-gmake
# End:
