Description
===========
Installs Subrosa, the clojure IRCd

see https://github.com/danlarkin/subrosa for more info.

Requirements
============
java and clojure, of course. runit is used for service management.

Attributes
==========
Just a handful of attributes, should be pretty clear how to use them.

* `node['subrosa']['tarball']` - where to save the downloaded tarball
* `node['subrosa']['path']` - path where Subrosa will be on the system
* `node['subrosa']['user']` - user to run as, default: `nobody`
* `node['subrosa']['group']` - group to run as, default: `nogroup`
* `node['subrosa']['port']` - port to listen on, default: `6667`
* `node['subrosa']['host']` - hostname to listent on, default: `localhost`
* `node['subrosa']['network']` - network name, default: `Subrosa`
* `node['subrosa']['ssl']` - ssl enabled? 
* `node['subrosa']['password']` - password protected?
* `node['subrosa']['fs-logging']['directory']` - where to keep logs

Usage
=====
Using this is as simple as adding `recipe[subrosa]` to a node or role.

TODO
====
* SSL setup is not currently done

Pull requests for fixes or features welcome!

License and Authors
===================
Author:: AJ Christensen <aj@hw-ops.com>
Author:: Sean Escriva <sean@hw-ops.com>

Copyright:: 2012, Heavy Water Operations, LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
