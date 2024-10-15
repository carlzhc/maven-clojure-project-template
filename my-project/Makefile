# Update project information in Makefile.conf.m4 file
-include Makefile.conf

parent_name ?= PARENT_NAME
parent_groupId ?= PARENT_GROUPID
parent_artifactId ?= PARENT_ARTIFACTID
parent_version ?= PARENT_VERSION

groupId ?= $(parent_groupId)
name ?= $(artifactId)
version  ?= 0.0.1-alpha

pom_macros := -D_GROUPID=$(parent_groupId) -D_ARTIFACTID=$(parent_artifactId) -D_NAME=$(parent_name) -D_VERSION=$(parent_version)
pom := pom.xml
conf := Makefile.conf

all: $(pom) help
help:
	@echo "Usage: $(MAKE) pom check clean"
	@echo "usage: $(MAKE) config parent_name=PROJECT parent_groupId=GROUP_ID parent_artifactId=ARTIFACT_ID parent_version=VERSION"
	@echo "usage: $(MAKE) submodule artifactId=ARTIFACT_ID [name=PROJECT] [groupId=GROUP_ID] [version=VERSION]"


check: $(pom)
	mvn versions:display-plugin-updates
	mvn versions:display-dependency-updates

pom: $(pom)
$(pom): $(pom).m4 $(conf)
	m4 $(pom_macros) $< | xmllint --format --output $@ -

config: $(conf).m4
	m4 $(pom_macros) $< | tee $(conf)

$(conf): $(conf).m4 Makefile
	m4 $(pom_macros) $< > $@

submodule: $(pom) $(name)/$(pom).m4
$(name)/$(pom).m4: # should not depends on anything to avoid overwriting
	[[ "$(@D)" ]] && [[ "$(@D)" != /* ]]
	mkdir -p $(@D)/src/{main,test}/clojure
	cp -f Makefile.submodule $(@D)/Makefile
	m4 -D_PARENT_GROUPID=$(parent_groupId) -D_PARENT_ARTIFACTID=$(parent_artifactId) -D_PARENT_NAME=$(parent_name) -D_PARENT_VERSION=$(parent_version) \
	   -D_GROUPID=$(groupId) -D_ARTIFACTID=$(artifactId) -D_NAME=$(name) -D_VERSION=$(version) \
	   $(pom).m4.submodule | xmllint --format --output $@ -
	cd $(@D) && make pom
	@# Add submodule in parent
	$(MAKE) --always-make $(pom)

clean:
	-rm -f *~ *.log

distclean: clean
	-rm -f $(pom) $(conf)

.PHONY: all clean config distclean help pom submodule

# Local Variables:
# mode: makefile-gmake
# End:
