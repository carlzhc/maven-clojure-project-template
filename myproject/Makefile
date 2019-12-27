proj := myproject
pom := pom.xml

all:
	@echo "usage: $(MAKE) <compile|run|package|repl|nrepl>"

$(pom): pom.xml.m4
	m4 $< | /usr/bin/xmllint --format - >$@

compile: $(pom)
	mvn clojure:compile

package: $(pom)
	mvn -Dmaven.test.skip=true package

run: $(pom)
	mvn clojure:run -Dclojure.script=src/$(subst .,/,$(proj))/core.clj

nrepl repl: $(pom)
	mvn clojure:$@

clean:
	-rm -rf target
