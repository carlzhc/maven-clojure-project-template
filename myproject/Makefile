name :=
groupId :=
artifactid :=


ifdef groupId
pom_macros := $(pom_macros) -D_GROUPID=$(groupId)
endif

ifdef name
pom_macros := $(pom_macros) -D_NAME=$(name)
endif

ifdef artifactid
pom_macros := $(pom_macros) -D_ARTIFACTID=$(artifactid)
endif

pom := pom.xml

all:
	@echo "usage: $(MAKE) <pom|depends|compile|test|run|package|assembly|repl|nrepl|clean|app|clojure>"


app: $(pom)
	mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart -DgroupId=$(groupId) -Dversion=0.0.1-SNAPSHOT

clojure: $(pom)
	mvn archetype:generate -DarchetypeGroupId=tk.skuro -DarchetypeArtifactId=clojure-maven-archetype -DgroupId=$(groupId) -Dversion=0.0.1-SNAPSHOT

depends: $(pom)
pom: $(pom)
$(pom): $(pom).m4
	m4 $(pom_macros) $< | /usr/bin/xmllint --format --output $@ -

compile test repl nrepl: depends
	mvn clojure:$@

package: depends
	mvn -Dmaven.test.skip=true package

assembly: depends
	mvn -Dmaven.test.skip=true package assembly:single

run: package
	mvn clojure:run

clean:
	-mvn clean

.PHONY: all depends compile test repl nrepl package assembly run clean
