---
layout: default
permalink: /configuration
---


Configuration
=====

All build configuration must be set on the file `eyecatch.rb` that located in the root path of your project repository. The `eyecatch.rb` is a simple Ruby-syntax file where you describe any commands that required for your web app. Eyecatch reads the configuration file each time it runs a build.

### Sample configuration file
```ruby
before_script do
  run 'mongod --fork --logpath /var/log/mongodb.log'
  run 'npm install'
  run 'npm install -g webpack'
  run 'ndenv rehash'
  run 'webpack -p --quiet'
end

window_width 1200

serve 'NODE_ENV=test node app.js'
port 1337

env 'MONGODB_HOST=localhost'
env 'MONGODB_DATABASE=test'
```

### serve, port
**Required** : Web app must be run with a single command.
After that Eyecatch will start crawling from localhost with specified port number.
```ruby
serve 'rails server'
port 3000
```

### before_script, after_script
You can specify bash commands to be executed before/after the build.
You can pass as many commands as you want. Commands must be wrapped with Ruby-style block.
Commends defined in `before_script` must return exit code 0, otherwise the build process will fail and
other commands will not be executed.
```ruby
before_script {
  run 'bundle install --verbose'

  run 'rake db:create'
  run 'rake db:migrate'
  run 'rake db:populate'
}
```

### window_width
Eyecatch will render the image with 1140px width by default.
You can override the value with the configuration file.

```ruby
# just one size
window_width 1024
```

```ruby
# You can also set multiple window size
window_width [320, 1140, 1920]
```

### state


### env
By default Eyecatch sets some general environment variables.
You can set new one or override them with `env` option.

- `USER=eyecatch`
- `HOME=/home/eyecatch`
- `CI=TRUE`
- `EYECATCH=TRUE`
- `DEBIAN_FRONTEND=noninteractive`
- `RAILS_ENV=test`
- `RACK_ENV=test`


### route
You can interact with the web app by following links and buttons. Eyecatch has the same methods as [Capybara](http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Actions) actions.
