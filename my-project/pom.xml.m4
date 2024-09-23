<?xml version="1.0" encoding="UTF-8"?>
<!-- This file is generated automatically, do not modify. dnl
define(`_dependency', `
<dependency>
<groupId>$1</groupId>
<artifactId>$2</artifactId>
<version>$3</version>
<scope>ifelse(`$4',,`compile',`$4')</scope>
</dependency>
')dnl
-->
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>_GROUPID</groupId>
  <artifactId>_ARTIFACTID</artifactId>
  <version>${revision}</version>
  <packaging>pom</packaging>
  <name>_NAME</name>
  <description></description>
  <url></url>
  <licenses>
    <license>
      <name>EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0</name>
      <url>https://www.eclipse.org/legal/epl-2.0/</url>
    </license>
  </licenses>
  <scm/>

  <modules>
    esyscmd(`find . -mindepth 2 -maxdepth 2 -type f -name pom.xml -printf "<module>%P\n" | sed "s#/.*#</module>#"')dnl
  </modules>

  <properties>
    <revision>_VERSION</revision>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <java.version>17</java.version>
    <maven.compiler.source>${java.version}</maven.compiler.source>
    <maven.compiler.target>${java.version}</maven.compiler.target>
    <maven.version.ignore>.+[-_.](alpha|Alpha|ALPHA|b|beta|Beta|BETA|rc|RC|M|EA)[-_.]?[0-9]*</maven.version.ignore>
    <clojure.mainClass>translit(_ARTIFACTID, -, _).core</clojure.mainClass>
  </properties>

  <dependencyManagement>
    <dependencies>
      _dependency(org.clojure, clojure, 1.8.0)
      _dependency(org.clojure, core.async, 1.6.681)
      _dependency(org.clojure, core.cache, 1.0.225)
      _dependency(org.clojure, core.logic, 1.0.1)
      _dependency(org.clojure, core.memoize, 1.0.257)
      _dependency(org.clojure, core.specs.alpha, 0.2.62)
      _dependency(org.clojure, data.json, 2.4.0)
      _dependency(org.clojure, data.priority-map, 1.1.0)
      _dependency(org.clojure, data.xml, 0.0.8)
      _dependency(org.clojure, test.check, 1.1.1, test)
      _dependency(org.clojure, test.generative, 1.0.0, test)
      _dependency(org.clojure, tools.logging, 1.2.4)
      _dependency(org.clojure, tools.nrepl, 0.2.13, test)
      _dependency(org.clojure, tools.reader, 1.3.7)
      _dependency(org.clojure, tools.trace, 0.7.11)
    </dependencies>
  </dependencyManagement>

  <build>
    <directory>target</directory>
    <outputDirectory>target/classes</outputDirectory>

    <pluginManagement>
      <!-- lock down plugins versions to avoid using Maven defaults -->
      <plugins>
        <plugin>
          <groupId>org.codehaus.mojo</groupId>
          <artifactId>versions-maven-plugin</artifactId>
          <version>2.16.2</version>
          <configuration>
            <generateBackupPoms>false</generateBackupPoms>
          </configuration>
        </plugin>

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.11.0</version>
        </plugin>

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>3.2.2</version>
          <configuration>
            <argLine>
              --illegal-access=permit
            </argLine>
          </configuration>
        </plugin>

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-failsafe-plugin</artifactId>
          <version>3.2.2</version>
          <configuration>
            <argLine>
              --illegal-access=permit
            </argLine>
          </configuration>
        </plugin>

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-enforcer-plugin</artifactId>
          <version>3.4.1</version>
          <executions>
            <execution>
              <id>enforce-maven</id>
              <goals>
                <goal>enforce</goal>
              </goals>
              <configuration>
                <rules>
                  <requireMavenVersion>
                    <version>3.3</version>
                  </requireMavenVersion>
                  <requireJavaVersion>
                    <version>[11.0.2,)</version>
                  </requireJavaVersion>
                </rules>
              </configuration>
            </execution>
          </executions>
        </plugin>

        <plugin>
          <groupId>com.theoryinpractise</groupId>
          <artifactId>clojure-maven-plugin</artifactId>
          <version>1.9.2</version>
          <extensions>true</extensions>
          <executions>
            <execution>
              <id>compile-clojure</id>
              <phase>compile</phase>
              <goals>
                <goal>compile</goal>
              </goals>
            </execution>
            <execution>
              <id>test</id>
              <phase>test</phase>
              <goals>
                <goal>test</goal>
              </goals>
            </execution>
          </executions>
        </plugin>

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-jar-plugin</artifactId>
          <version>3.3.0</version>
          <configuration>
            <archive>
              <manifest>
                <addClasspath>true</addClasspath>
                <mainClass>${clojure.mainClass}</mainClass>
                <classpathPrefix>dependency/</classpathPrefix>
                <classpathLayoutType>simple</classpathLayoutType>
              </manifest>
            </archive>
          </configuration>
        </plugin>

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-dependency-plugin</artifactId>
          <version>3.6.1</version>
          <executions>
            <execution>
              <id>copy-dependencies</id>
              <phase>package</phase>
              <goals>
                <goal>copy-dependencies</goal>
              </goals>
            </execution>
          </executions>
        </plugin>

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-shade-plugin</artifactId>
          <version>3.6.0</version>
          <executions>
            <execution>
              <phase>package</phase>
              <goals>
                <goal>shade</goal>
              </goals>
            </execution>
          </executions>
        </plugin>
      </plugins>
    </pluginManagement>
  </build>

  <repositories>
    <repository>
      <id>central</id>
      <url>https://repo1.maven.org/maven2/</url>
      <snapshots>
        <enabled>false</enabled>
      </snapshots>
      <releases>
        <enabled>true</enabled>
      </releases>
    </repository>
    <!-- <repository> -->
    <!--   <id>clojars</id> -->
    <!--   <url>https://repo.clojars.org/</url> -->
    <!--   <snapshots> -->
    <!--     <enabled>true</enabled> -->
    <!--   </snapshots> -->
    <!--   <releases> -->
    <!--     <enabled>true</enabled> -->
    <!--   </releases> -->
    <!-- </repository> -->
  </repositories>
</project>

<!-- Local Variables: -->
<!-- mode: nxml -->
<!-- nxml-slash-auto-complete-flag: true -->
<!-- End: -->
