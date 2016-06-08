before_script {
  run 'bundle install --path vendor/bundle'
}

serve 'bundle exec jekyll serve'
port 4000
