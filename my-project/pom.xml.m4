<?xml version="1.0" encoding="UTF-8"?>
<!-- This file is generated automatically, do not modify. dnl
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
-->
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>_GROUPID</groupId>
  <artifactId>_ARTIFACTID</artifactId>
  <version>_VERSION</version>
  <name>_NAME</name>
  <packaging>pom</packaging>
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
    esyscmd(`find * -mindepth 1 -maxdepth 1 -type f -name pom.xml -printf "<module>%h</module>\n"')
  </modules>

  <properties>
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
      _dependency(org.clojure, clojure, 1.12.0)
      _dependency(org.clojure, core.async, 1.6.681)
      _dependency(org.clojure, core.cache, 1.1.234)
      _dependency(org.clojure, core.logic, 1.1.0)
      _dependency(org.clojure, core.memoize, 1.1.266)
      _dependency(org.clojure, core.specs.alpha, 0.4.74)
      _dependency(org.clojure, data.json, 2.5.0)
      _dependency(org.clojure, data.priority-map, 1.2.0)
      _dependency(org.clojure, data.xml, 0.0.8)
      _dependency(org.clojure, test.check, 1.1.1, test)
      _dependency(org.clojure, test.generative, 1.1.0, test)
      _dependency(org.clojure, tools.logging, 1.3.0)
      _dependency(org.clojure, tools.nrepl, 0.2.13, test)
      _dependency(org.clojure, tools.reader, 1.5.0)
      _dependency(org.clojure, tools.trace, 0.8.0)
    </dependencies>
  </dependencyManagement>

  <build>
    <directory>target</directory>
    <outputDirectory>target/classes</outputDirectory>

    <!-- lock down plugins versions to avoid using Maven defaults -->
    <plugins>
      <plugin>
        <!-- Clean up after the build. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-clean-plugin</artifactId>
        <version>3.4.0</version>
      </plugin>

      <plugin>
        <!-- Compiles Java sources. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.13.0</version>
      </plugin>

      <plugin>
        <!-- Run the JUnit integration tests in an isolated classloader. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-failsafe-plugin</artifactId>
        <version>3.5.1</version>
        <configuration>
          <argLine>
            --illegal-access=permit
          </argLine>
        </configuration>
      </plugin>

      <plugin>
        <!-- Copy the resources to the output directory for including in the JAR. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-resources-plugin</artifactId>
        <version>3.3.1</version>
        <configuration>
          <argLine>
            --illegal-access=permit
          </argLine>
        </configuration>
      </plugin>

      <plugin>
        <!-- Run the JUnit unit tests in an isolated classloader. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>3.5.1</version>
        <configuration>
          <argLine>
            --illegal-access=permit
          </argLine>
        </configuration>
      </plugin>

      <plugin>
        <!-- Build a JAR from the current project. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-jar-plugin</artifactId>
        <version>3.4.2</version>
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
        <!-- Build an Uber-JAR from the current project, including dependencies. -->
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

      <plugin>
        <!-- Dependency manipulation (copy, unpack) and analysis. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-dependency-plugin</artifactId>
        <version>3.8.0</version>
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
        <!-- Environmental constraint checking (Maven Version, JDK etc), User Custom Rule Execution. -->
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-enforcer-plugin</artifactId>
        <version>3.5.0</version>
        <executions>
          <execution>
            <id>enforce-maven</id>
            <goals>
              <goal>enforce</goal>
            </goals>
            <configuration>
              <rules>
                <requireMavenVersion>
                  <version>3.6.3</version>
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
        <!-- Manage versions of your project, its modules, dependencies and plugins. -->
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>versions-maven-plugin</artifactId>
        <version>2.17.1</version>
        <configuration>
          <generateBackupPoms>false</generateBackupPoms>
        </configuration>
      </plugin>
    </plugins>

    <pluginManagement>
      <plugins>
        <plugin>
          <groupId>com.theoryinpractise</groupId>
          <artifactId>clojure-maven-plugin</artifactId>
          <version>1.9.3</version>
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
