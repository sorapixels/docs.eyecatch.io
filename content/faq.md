---
layout: default
permalink: /faq
---

Frequently Asked Questions
=====

### Do you support BitBucket or GitLab?
Currently we only support GitHub for building and authentication. Sorry about that.

### Command not found after `npm install -g ***`
Try `ndenv rehash` after global installing. It will recreate symbolic links
to make npm packages accessble.

### How do I use Eyecatch with static html files?
You just need to serve those files with Rack or similar app.
Here's an example using Rack, put those files in your repository root.

#### eyecatch.rb
```ruby
before_script do
  run 'gem install rack'
end

serve 'rackup'
port 9292
```

#### config.ru
```ruby
use Rack::Static,
  urls: Dir.glob('./*').map { |s| s.gsub(/./, '')},
  index: 'index.html'

run proc{ |env| [ 404, { 'Content-Type': 'text/html' }, ['404'] ] }
```
