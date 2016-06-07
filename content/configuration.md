---
layout: default
permalink: /configuration
---

Configuration
=====

All build configuration must be set in the file `eyecatch.rb` located at the root path of your project repository. The `eyecatch.rb` is a simple Ruby-syntax file where you configure your web app. Eyecatch reads the configuration file each time it runs a build.

## Examples

### Minimal example
```ruby
serve 'ruby app.rb'
port 3000
```

### A bit more complex example
```ruby
before_script do
  run 'mongod --fork --logpath /var/log/mongodb.log'
  run 'npm install'
  run 'npm install -g webpack'
  run 'ndenv rehash'
  run 'webpack -p --quiet'
end

state(:admin) {
  before_access {
    fill_in 'username', with: 'jill'
    fill_in 'password', with: 'birthday'
    click_button 'Submit'
  }
  entry_point '/login'
}

window_width 1200

serve 'NODE_ENV=test node app.js'
port 1337

env 'MONGODB_HOST=localhost'
env 'MONGODB_DATABASE=test'
```

## Directives

### serve, port
**Required** : Web app must be run with a single command, running in the foreground.
After that Eyecatch will start crawling from localhost with specified port number.

```ruby
serve 'rails server'
port 3000
```

### before_script, after_script
You can specify bash commands to be executed before/after the build.
You can pass as many commands as you want. Commands must be wrapped with Ruby-style block.
Commands defined in `before_script` must return exit code 0, otherwise the build process will fail and
other commands will not be executed.

```ruby
before_script {
  run 'bundle install --verbose --deployment --path vendor/bundle'

  run 'rake db:create'
  run 'rake db:migrate'
  run 'rake db:populate'
}
```

### entry_point, exclude_paths
If there are unlinked pages, something like admin page, they cannot be accessible
with automatic crawling. So you need to specify them explicitly. Crawling program will start from
each `entry_point`.
Conversely, if you need to exclude some pages from capturing target, use `exclude_paths` for that purpose.

```ruby
entry_point ['/admin', '/orphan']
exclude_paths ['/dont-access-me']
```

### window_width
Eyecatch will render the image with 1140px width by default.
You can override the value with the configuration file.

```ruby
# just one size
window_width 1024

# You can also set multiple window size
window_width [320, 1140, 1920]
```

### state
Sometimes you need to create multiple user sessions. Here's an example of how you do that.
You can interact with the web app by following links and buttons. Eyecatch has the same methods as [Capybara](http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Actions) actions.

```ruby
state(:jack) {
  before_access {
    fill_in 'username', with: 'jack'
    fill_in 'password', with: 'secret'
    click_button 'Submit'
  }
  entry_point '/login'
}

state(:jill) {
  before_access {
    fill_in 'username', with: 'jill'
    fill_in 'password', with: 'birthday'
    click_button 'Submit'
  }
  entry_point '/login'
}
```

### start_delay, capture_delay
If the server process needs a moment before capturing, it might be worth adding a `start_delay` to prevent problems.
There is `capture_delay` option as well and it is useful for the pages which contain large images or something like that.

```ruby
start_delay 10  # waits 10 seconds before page capturing
capture_delay 5 # waits 5 seconds after accessing each pages
```


### env
By default Eyecatch sets some general environment variables.
You can set new one or override them with `env` option and the project's configuration page.

- `USER=eyecatch`
- `HOME=/home/eyecatch`
- `CI=TRUE`
- `EYECATCH=TRUE`
- `DEBIAN_FRONTEND=noninteractive`
- `RAILS_ENV=test`
- `RACK_ENV=test`
