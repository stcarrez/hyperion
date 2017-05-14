# Hyperion Monitoring Server

[![Build Status](https://img.shields.io/jenkins/s/http/jenkins.vacs.fr/Hyperion.svg)](http://jenkins.vacs.fr/job/Hyperion/)
[![License](http://img.shields.io/badge/license-APACHE2-blue.svg)](LICENSE)
![Commits](https://img.shields.io/github/commits-since/stcarrez/hyperion/0.0.0.svg)

Hyperion is the monitoring server that collects information provided by
the [Helios](https://github.com/stcarrez/helios).

To build Hyperion you will need the following projects:

* AWA           (https://github.com/stcarrez/ada-awa)
* ASF           (https://github.com/stcarrez/ada-asf)
* ADO           (https://github.com/stcarrez/ada-ado)
* Ada Util      (https://github.com/stcarrez/ada-util)
* Ada Wiki      (https://github.com/stcarrez/ada-wiki)
* Ada EL        (https://github.com/stcarrez/ada-el)
* Ada Security  (https://github.com/stcarrez/ada-security)
* Dynamo        (https://github.com/stcarrez/dynamo)

Hyperion relies on the following external projects:

* AWS      (http://libre.adacore.com/libre/tools/aws/)
* XMLAda   (http://libre.adacore.com/libre/tools/xmlada/)

Before building and configuring Hyperion, you should have configured, built and installed
all of the above projects.

# Building Hyperion

To configure Hyperion, use the following command:
```
   ./configure
```
Then, build the application:
```
   make generate build
```
      