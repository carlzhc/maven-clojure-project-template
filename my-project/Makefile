name ?= my-project
groupId ?= my.group
artifactId ?= my-artifact
version ?= 0.0.1-SNAPSHOT
artifactId_d := $(subst -,_,$(artifactId))
pom_macros := -D_GROUPID=$(groupId) -D_NAME=$(name) -D_VERSION=$(version) -D_ARTIFACTID=$(artifactId)
pom := pom.xml

all:
	@echo "usage: $(MAKE) <pom|depends|compile|test|run|package|assembly|native|repl|nrepl|clean|app|clojure>"


app:
	mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart \
	-DgroupId=$(groupId) -DartifactId=$(artifactId) -Dversion=$(version)
	$(MAKE) pom

clojure:
	mvn archetype:generate -DarchetypeGroupId=tk.skuro -DarchetypeArtifactId=clojure-maven-archetype \
	-DgroupId=$(groupId) -DartifactId=$(artifactId) -Dversion=$(version) -Dpackage=$(groupId)-$(artifactId)
	$(MAKE) pom

depends: $(pom) src/main/clojure/$(artifactId_d)/core.clj
pom: $(pom)
$(pom): $(pom).m4 Makefile
	m4 $(pom_macros) $< | /usr/bin/xmllint --format --output $@ -

src/main/clojure/$(artifactId_d)/core.clj:
	mkdir -p src/{main,test}/{clojure,java,resources}
	mkdir -p src/{main,test}/{clojure,java}/$(artifactId_d)
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
	mvn package

uberjar_file := target/$(artifactId)-$(version)-jar-with-dependencies.jar

assembly: $(uberjar_file)
$(uberjar_file): depends
	mvn package assembly:single

native_image := target/$(artifactId)-$(version)
native: assembly $(native_image)
$(native_image):
	native-image --initialize-at-build-time --report-unsupported-elements-at-runtime -jar $(uberjar_file) $@

run: package
	mvn clojure:run

clean:
	-mvn clean

.PHONY: all depends compile test repl nrepl package assembly run clean
