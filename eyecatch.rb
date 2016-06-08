before_script {
  run 'bundle install --path vendor/bundle'
}

serve 'jekyll serve'
port 4000
