name ?=
groupId ?=
artifactId ?=


ifdef groupId
pom_macros := $(pom_macros) -D_GROUPID=$(groupId)
endif

ifdef name
pom_macros := $(pom_macros) -D_NAME=$(name)
endif

ifdef artifactId
pom_macros := $(pom_macros) -D_ARTIFACTID=$(artifactId)
endif

pom := pom.xml

all:
	@echo "usage: $(MAKE) <pom|depends|compile|test|run|package|assembly|repl|nrepl|clean|app|clojure>"


app:
	mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart \
	-DgroupId=$(groupId) -DartifactId=$(artifactId) -Dversion=0.0.1-SNAPSHOT
	$(MAKE) pom

clojure:
	mvn archetype:generate -DarchetypeGroupId=tk.skuro -DarchetypeArtifactId=clojure-maven-archetype \
	-DgroupId=$(groupId) -DartifactId=$(artifactId) -Dversion=0.0.1-SNAPSHOT -Dpackage=$(groupId)-$(artifactId)
	$(MAKE) pom

depends: $(pom) src/main/clojure/$(artifactId)/core.clj
pom: $(pom)
$(pom): $(pom).m4
	m4 $(pom_macros) $< | /usr/bin/xmllint --format --output $@ -

src/main/clojure/$(artifactId)/core.clj:
	mkdir -p src/{main,test}/{clojure,java,resources}
	mkdir -p src/{main,test}/{clojure,java}/$(artifactId)
	( \
echo '(ns $(artifactId).core'; \
echo '  (:gen-class))'; \
echo ''; \
echo '(defn -main'; \
echo '  "I do not do a whole lot ... yet."'; \
echo '  [& args]'; \
echo '  (println "Hello, World!"))'; \
) > $@


compile test repl: depends
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
