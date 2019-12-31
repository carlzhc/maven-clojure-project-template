<?xml version="1.0" encoding="UTF-8"?>
<!-- This file is generated automatically, do not modify. dnl
define(`_GROUPID', `com.example')dnl
define(`_NAME', esyscmd(`echo -n ${PWD##*/}'))dnl
define(`_ARTIFACTID', _NAME)dnl
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
  <packaging>clojure</packaging>
  <version>${revision}</version>
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

  <properties>
    <revision>0.1.0-SNAPSHOT</revision>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
    <java.version>1.8</java.version>
    <clojure.mainClass>_ARTIFACTID.core</clojure.mainClass>
  </properties>

  <dependencies>
    _dependency(org.clojure, clojure, 1.10.1)
    _dependency(org.clojure, tools.reader, 1.3.2)
    _dependency(org.clojure, tools.nrepl, 0.2.13)
    _dependency(org.clojure, data.json, 0.2.7)
    _dependency(org.clojure, data.xml, 0.0.8)
  </dependencies>

  <build>
    <directory>target</directory>
    <outputDirectory>target/classes</outputDirectory>

    <plugins>
      <plugin>
        <groupId>com.theoryinpractise</groupId>
        <artifactId>clojure-maven-plugin</artifactId>
        <version>1.8.3</version>
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
        <version>3.2.0</version>
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
        <version>3.1.1</version>
        <executions>
          <execution>
            <id>copy-dependencies</id>
            <phase>package</phase>
            <goals>
              <goal>copy-dependencies</goal>
            </goals>
          </execution>
        </executions>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>

      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-assembly-plugin</artifactId>
        <version>3.2.0</version>
        <configuration>
          <archive>
            <manifest>
              <mainClass>${clojure.mainClass}</mainClass>
            </manifest>
          </archive>
          <descriptorRefs>
            <descriptorRef>jar-with-dependencies</descriptorRef>
          </descriptorRefs>
        </configuration>
      </plugin>

      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.7.0</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>
    </plugins>
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
    <repository>
      <id>clojars</id>
      <url>https://repo.clojars.org/</url>
      <snapshots>
        <enabled>true</enabled>
      </snapshots>
      <releases>
        <enabled>true</enabled>
      </releases>
    </repository>
  </repositories>
</project>