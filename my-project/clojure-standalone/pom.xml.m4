<?xml version="1.0" encoding="UTF-8"?>
<!-- This file is generated automatically, do not modify. -->
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <parent>
    <groupId>PARENT_GROUPID</groupId>
    <artifactId>PARENT_ARTIFACTID</artifactId>
    <version>PARENT_VERSION</version>
  </parent>
  <properties>
    <revision>1.12.2</revision>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <project.url/>
    <java.version>21</java.version>
    <maven.compiler.source>${java.version}</maven.compiler.source>
    <maven.compiler.target>${java.version}</maven.compiler.target>
    <maven.version.ignore>.+[-_.](alpha|Alpha|ALPHA|b|beta|Beta|BETA|rc|RC|M|EA)[-_.]?[0-9]*</maven.version.ignore>
    <clojure.mainClass>clojure.main</clojure.mainClass>
    <mainClass>${clojure.mainClass}</mainClass>
    <additionalClassPath/>
  </properties>
  <groupId>carlzhc</groupId>
  <artifactId>clojure-standalone</artifactId>
  <name>clojure-standalone</name>
  <version>${revision}</version>
  <packaging>clojure</packaging>
  <description/>
  <url>${project.url}</url>
  <licenses>
    <license>
      <name>EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0</name>
      <url>https://www.eclipse.org/legal/epl-2.0/</url>
    </license>
  </licenses>
  <scm/>
  <dependencies>
    <dependency>
      <groupId>org.clojure</groupId>
      <artifactId>clojure</artifactId>
    </dependency>
    <dependency>
      <groupId>org.clojure</groupId>
      <artifactId>data.json</artifactId>
    </dependency>
    <dependency>
      <groupId>org.clojure</groupId>
      <artifactId>data.xml</artifactId>
    </dependency>
    <dependency>
      <groupId>org.clojure</groupId>
      <artifactId>tools.logging</artifactId>
    </dependency>
  </dependencies>
  <build>
    <directory>target</directory>
    <outputDirectory>target/classes</outputDirectory>
    <plugins>
      <plugin>
        <groupId>com.theoryinpractise</groupId>
        <artifactId>clojure-maven-plugin</artifactId>
        <extensions>true</extensions>
      </plugin>
      <plugin>
        <!-- This snippet configures a special resource transformer which
             sets the Main-Class entry in the MANIFEST.MF of the shaded
             JAR. Other entries can be added to the MANIFEST.MF as well via
             key-value pairs in the <manifestEntries> section:
        -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <executions>
          <execution>
            <phase>package</phase>
            <goals>
              <goal>shade</goal>
            </goals>
            <configuration>
              <transformers>
                <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                  <manifestEntries>
                    <Main-Class>${clojure.mainClass}</Main-Class>
                    <!-- <Build-Number>123</Build-Number> -->
                  </manifestEntries>
                </transformer>
              </transformers>
            </configuration>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
</project>
<!-- Local Variables: -->
<!-- mode: nxml -->
<!-- nxml-slash-auto-complete-flag: true -->
<!-- End: -->
