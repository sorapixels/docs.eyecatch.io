---
layout: default
permalink: /configuration
---

{::options parse_block_html="true" /}

Configuration
=====

The build configuration must be set in the file `eyecatch.rb` located at the root path of your project repository.  
`eyecatch.rb` is a simple Ruby file where you configure your web application.  
Eyecatch reads the configuration file each time it runs a build.

## Examples

### Minimal example

```ruby
serve 'ruby app.rb'
port 3000
```

### Real world example

```ruby
serve 'node app.js'
port 1337

service 'mongodb'
service 'redis'

window_width 1200

before_build {
  run 'mongod --fork --logpath /var/log/mongodb.log'
  run 'npm install'
  run 'npm install -g webpack'
  run 'ndenv rehash'
  run 'webpack -p --quiet'
}

task(:admin) {
  before_capture('/login') {
    fill_in 'username', with: 'jill'
    fill_in 'password', with: 'birthday'
    click_button 'Submit'
  }
  entry_point '/login'
}

env 'NODE_ENV=test'
env 'MONGODB_HOST=localhost'
env 'MONGODB_DATABASE=test'
```

## API documentation

### Required

* [serve](#serve)
* [port](#port)

### Optional

* [no_cache](#nocache)
* [start_delay](#startdelay)
* [capture_delay](#capturedelay)
* [window_width](#windowwidth)
* [service](#service)
* [env](#env)
* [before_build](#beforebuild)
  * [run](#run)
* [before_capture](#beforecapture)
* [task](#task)
  * [entry_point](#entrypoint)
  * [exclude_paths](#excludepaths)
  * [before_capture](#beforecapture-1)

### `serve`

* Required: yes
* Argument: `String`

The command to run the application HTTP server.  
The command must run in the foreground,
and the server should listen on localhost.

#### Example

```ruby
serve 'bundle exec rails server'
```

### `port`

* Required: yes
* Argument: `Integer`

The port on which the application HTTP server is listening.

#### Example

```ruby
port 3000
```

### `no_cache`

* Argument: `Boolean`
* Default: `false`

Disable the CI server cache.

#### Example

```ruby
no_cache true
```

### `start_delay`

* Argument: `Integer`
* Default: `0`

The time to wait after starting the server in seconds.  
Set the value according to the time your HTTP server needs to boot.

#### Example

```ruby
start_delay 3
```

### `capture_delay`

* Argument: `Integer`
* Default: `3`

The time to wait when visiting the page before capturing the screenshot.  
This value can be increased if image or other resources are not loaded fast enough.

#### Example

```ruby
capture_delay 5
```

### `window_width`

* Argument: `Integer` \| `Array<Integer>`
* Default: `1140`

The window width used to capture screenshots.  
If an array is passed, the tasks will be executed with all given widths.

#### Example

```ruby
window_width [768, 1280, 1920]
```

### `service`

* Argument: `String`
* Multiple: yes

Define a service to be started when before the build is launched.  
The service will be started before running [before_build](#beforebuild).

#### Example

```ruby
service 'postgresql'
service 'redis'
```

#### Available services

The following services are currently available:

* `postgresql`
* `mysql`
* `mongodb`
* `redis`

Check the [Database setup](/database-setup) documentation for more information.

### `env`

* Argument: `String` - should be of the form `key=value`
* Multiple: yes

Set an environment variable. The environment variable will be available during the build.

#### Example

```ruby
env 'RAILS_ENV=test'
env 'DATABASE_URL=postgres://postgres@localhost/app_test'
```

#### Default environment variables

* `USER=eyecatch`
* `HOME=/home/eyecatch`
* `CI=TRUE`
* `EYECATCH=TRUE`
* `DEBIAN_FRONTEND=noninteractive`
* `RAILS_ENV=test`
* `RACK_ENV=test`

### `before_build`

* Argument: `block`

Execute the given block before starting the build.  
This can be used to install dependencies, populate the database,
or configuration the application.

The following methods are available inside the `before_build` block.


<div class="nested-doc">

#### `run`

* Argument: `String`
* Multiple: yes

Run the given command as a superuser.

</div>

#### Example

```ruby
before_build {
  run 'bundle install'
  run 'bundle rake db:create'
  run 'bundle rake db:migrate'
  run 'bundle rake db:populate'
}
```

### `before_capture`

* Arguments: [`String`, `block`]
* Multiple: yes

Execute the given code when accessing the given path before capturing the screenshot.  
The given block will be executed inside a [`Capybara::Session`][capybara_session],
so you can use any of the methods it defines.

#### Example

```ruby
before_capture('/login') {
  fill_in 'username', with: 'jill'
  fill_in 'password', with: 'birthday'
  click_button 'Submit'
}
```

NOTE: The above example will change page before capturing the screenshot.
The screenshot will therefore be captured on the target page of the form
and not the login page.

### `task`

* Arguments: [`String` \| `Symbol`, `block`]
* Multiple: yes

Define a task, which maps to a browser session and crawls
the pages starting from the given endpoints.

NOTE: If no task is defined, a default task will be executed,
and start crawling at `/`. If a task is defined, the default
task is not used.

The following methods can be used inside the `task` block.

<div class="nested-doc">

#### `entry_point`

* Argument: `String` \| `Array<String>`

The entry point from which the crawling should start.

#### `exclude_paths`

* Argument: `Array<String>`

A list of paths to be excluded from the crawling.

#### `before_capture`

* Arguments: [`String`, `block`]
* Multiple: yes

Same as top level [`before_capture`](#beforecapture) but will only be
executed for the current task.
</div>

#### Example

```ruby
task(:anonymous) {
  entry_point ['/', '/about']
}

task(:admin) {
  entry_point '/login'
  before_capture('/login') {
    fill_in 'username', with: 'jill'
    fill_in 'password', with: 'birthday'
    click_button 'Submit'
  }
  exclude_paths ['/about']
}
```

[capybara_session]: http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Session
