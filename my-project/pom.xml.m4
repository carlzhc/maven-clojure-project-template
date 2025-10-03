<?xml version="1.0" encoding="UTF-8"?>
<!-- This file is generated automatically, do not modify. include(`macros.m4')-->
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
    <project.url>https://github.com/carlzhc/maven-clojure-project-template</project.url>
    <java.version>17</java.version>
    <maven.compiler.source>${java.version}</maven.compiler.source>
    <maven.compiler.target>${java.version}</maven.compiler.target>
    <maven.version.ignore>.+[-_.](alpha|Alpha|ALPHA|b|beta|Beta|BETA|rc|RC|M|EA)[-_.]?[0-9]*</maven.version.ignore>
    <clojure.mainClass>translit(_ARTIFACTID, -, _).core</clojure.mainClass>
  </properties>

  <dependencyManagement>
    <dependencies>
      _dependency(org.clojure, clojure, 1.12.3)
      _dependency(org.clojure, core.async, 1.8.741)
      _dependency(org.clojure, core.cache, 1.1.234)
      _dependency(org.clojure, core.logic, 1.1.0)
      _dependency(org.clojure, core.memoize, 1.1.266)
      _dependency(org.clojure, core.specs.alpha, 0.4.74)
      _dependency(org.clojure, data.json, 2.5.1)
      _dependency(org.clojure, data.priority-map, 1.2.0)
      _dependency(org.clojure, data.xml, 0.0.8)
      _dependency(org.clojure, test.check, 1.1.1, test)
      _dependency(org.clojure, test.generative, 1.1.0, test)
      _dependency(org.clojure, tools.logging, 1.3.0)
      _dependency(org.clojure, tools.nrepl, 0.2.13, test)
      _dependency(org.clojure, tools.reader, 1.5.2)
      _dependency(org.clojure, tools.trace, 0.8.0)
    </dependencies>
  </dependencyManagement>

  <build>
    <directory>target</directory>
    <outputDirectory>target/classes</outputDirectory>

    <!-- lock down plugins versions to avoid using Maven defaults -->
    <plugins>
      <!-- Responsible for removing the target directory and any other
           configured output directories, ensuring a clean build. -->
      _plugin(, maven-clean-plugin, 3.5.0)

      <!-- Compiles the project's source code. -->
      _plugin(, maven-compiler-plugin, 3.14.1)

      <!-- Deploys the project artifact to a remote repository, making it
           available for other developers or continuous integration
           systems. -->
      _plugin(, maven-deploy-plugin, 3.1.4)

      <!-- Environmental constraint checking (Maven Version, JDK etc), User
           Custom Rule Execution. -->
      _plugin(, maven-enforcer-plugin, 3.6.2, `
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
                <version>[8.0.0,)</version>
              </requireJavaVersion>
            </rules>
          </configuration>
        </execution>
      </executions>
      ')

      <!-- Run the JUnit integration tests in an isolated classloader. -->
      _plugin(, maven-failsafe-plugin, 3.5.4, `
      <configuration>
        <argLine>
          --illegal-access=permit
        </argLine>
      </configuration>
      <executions>
        <execution>
          <id>default-test</id>
          <phase>none</phase>
        </execution>
      </executions>
      ')
    
      <!-- Installs the project artifact (e.g., JAR, WAR) into the local Maven
           repository for use by other local projects. -->
      _plugin(, maven-install-plugin, 3.1.4)

      <!-- Creates a Java Archive (JAR) file from the compiled project classes
           and resources. -->
      _plugin(, maven-jar-plugin, 3.4.2)

      <!-- Handles the copying of project resources (e.g., configuration files,
           images) from the source directory to the build output directory. -->
      _plugin(, maven-resources-plugin, 3.3.1)

      <!-- Generates a project website, including documentation, reports, and
           other project information. -->
      _plugin(, maven-site-plugin, 3.21.0)

      <!-- Executes unit tests during the build process and generates test reports. -->
      _plugin(, maven-surefire-plugin, 3.5.4, `
      <configuration>
        <argLine>
          --illegal-access=permit
        </argLine>
      </configuration>
      <executions>
        <execution>
          <id>default-test</id>
          <phase>none</phase>
        </execution>
      </executions>
      ')

      <!-- Manage versions of your project, its modules, dependencies and plugins. -->
      _plugin(, versions-maven-plugin, 2.19.0, `
      <configuration>
        <generateBackupPoms>false</generateBackupPoms>
      </configuration>
      ')
    </plugins>

    <!-- project plugins -->
    <pluginManagement>
      <plugins>
        _plugin(, maven-source-plugin, 3.3.1, `
        <executions>
          <execution>
            <id>attach-sources</id>
            <goals>
              <goal>jar</goal>
            </goals>
          </execution>
        </executions>
        ')

        _plugin(, maven-javadoc-plugin, 3.12.0, `
        <executions>
          <execution>
            <id>attach-javadocs</id>
            <goals>
              <goal>jar</goal>
            </goals>
          </execution>
        </executions>
        ')


        <!-- Build an Uber-JAR from the current project, including dependencies. -->
        _plugin(, maven-shade-plugin, 3.6.1, `
        <executions>
          <execution>
            <phase>package</phase>
            <goals>
              <goal>shade</goal>
            </goals>
            <configuration>
              <transformers>
                <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                  <mainClass>${mainClass}</mainClass>
                </transformer>
              </transformers>
            </configuration>
          </execution>
        </executions>
        ')

        <!-- Dependency manipulation (copy, unpack) and analysis. -->
        _plugin(, maven-dependency-plugin, 3.9.0, `
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
          <source>8</source>
          <target>8</target>
        </configuration>
        ')


        _plugin(com.theoryinpractise, clojure-maven-plugin, 1.9.3, `
        <extensions>true</extensions>
        <executions>
          <execution>
            <id>default-test</id>
            <goals>
              <goal>test</goal>
            </goals>
          </execution>
        </executions>
        ')

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
