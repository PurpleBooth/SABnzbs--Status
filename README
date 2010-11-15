Notifier
========
Description
-----------

Puts pop-up notifications about the current status of SABnzbd+ on your screen
using notify-send (libnotify).

Currently notifies when SABnzbd+ adds an item to a queue, when an item is
completed, and when an item begins being processed (i.e. starts being
downloaded).

Requires
--------

notify-send from the (on debian based systems libnotify-bin).

<pre>
    sudo apt-get install libnotify-bin
</pre>

In order to run the rake tasks for generating the documentation you'll need YARD
and Reek installed. These can be installed using ruby's gem.

<pre>
    sudo gem install reek
    sudo gem install yard
</pre>

Configuration
-------------

For configuration we use the YAML syntax.

<pre>
sabnzbd_plus:
  model:
    api:
      caller:
        http_json:
          api_key: "48e93e8b1aaf946f541cc5118a531f48"
          api_endpoint: "http://127.0.0.1:8880/api"
          api_output: "json"
        test:
          api_key: "Mock API Key"
          fixtures_directory: "test/fixtures/SABnzbd+"
log:
  log:
    file: "log/application.log"
notify:
  lib_notify:
    icon: "favicon.ico"
</pre>

Parameters you probably want to change are

### Your API key
sabnzbd_plus -> model -> api -> caller -> http_json -> api_key

### Your SABnzbd+ API endpoint

sabnzbd_plus -> model -> api -> caller -> http_json -> api_key

So for example if your SAB url is http://127.0.0.1:8880/sabnzbd your API
endpoint will be http://127.0.0.1:8880/api