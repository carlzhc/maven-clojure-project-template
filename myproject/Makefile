proj := myproject
pom := pom.xml

all:
	@echo "usage: $(MAKE) <compile|test|run|package|assembly|repl|nrepl|clean>"

depends: $(pom)
$(pom): pom.xml.m4
	m4 $< | /usr/bin/xmllint --format --output $@ -

compile test repl nrepl: depends
	mvn clojure:$@

package: depends
	mvn -Dmaven.test.skip=true package

assembly: depends
	mvn assembly:single

run: depends
	mvn clojure:run

clean:
	-rm -rf target

.PHONY: all depends compile test repl nrepl package assembly run clean
