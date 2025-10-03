divert(`-1')
define(`_dependency', `
<dependency>
<groupId>$1</groupId>
<artifactId>$2</artifactId>
ifelse(`$3',,`dnl',`<version>$3</version>')
ifelse(`$4',,`dnl',`<scope>$4</scope>')
</dependency>
')

define(`_plugin', `
<plugin>
<groupId>ifelse(`$1',,org.apache.maven.plugins,`$1')</groupId>
<artifactId>$2</artifactId>
ifelse(`$3',,`dnl',`<version>$3</version>')
ifelse(`$4',,`dnl',`$4')
</plugin>
')
divert`'dnl
