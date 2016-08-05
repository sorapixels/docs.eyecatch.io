before_build {
  run 'bundle install --path vendor/bundle'
}

task(:default) {
  exclude_paths [/.*#.*/]
}

serve 'bundle exec jekyll serve'
port 4000
