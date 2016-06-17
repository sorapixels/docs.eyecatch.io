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
You just need to serve those files via HTTP.
Here's some examples using Python, Ruby and PHP built-in server:

#### eyecatch.rb
```ruby
serve 'python -m http.server 8000'
port 8000
```

```ruby
serve 'ruby -run -e httpd ./ -p 8000'
port 8000
```

```ruby
serve 'php -S localhost:8000'
port 8000
```
