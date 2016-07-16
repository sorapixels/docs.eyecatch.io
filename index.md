---
layout: default
---

Welcome to Eyecatch
=====

Eyecatch is a hosted Continuous Integration service for designers and front-end engineers.

Eyecatch will automatically render all your pages, let you preview them, and compare them with their previous version to tell you what changed. Let everyone see what your changes really look like, discuss with your team about what really matters, and never be bothered by a design bugs again.

## Getting started

Getting started with Eyecatch is very easy.
Here are a few steps to get you running:

1. Login with your GitHub account from [Eyecatch.io](https://eyecatch.io/)
2. [Add a project](https://eyecatch.io/new) you would like to test
3. [Add eyecatch.rb](https://docs.eyecatch.io/configuration) to the root of your project.
   Here is a simple example:

   ```ruby
   # eyecatch.rb

   serve 'ruby app.rb'
   port 3000
   ```

4. Commit, push and enjoy!

Check the documentation for more information.

### Is something missing?

If you notice something we've missed or could be improved on,
please help us to make this document better.
Feel free to make a PR on [GitHub][] or send a message via [twitter][].

[github]:https://github.com/sorapixels/docs.eyecatch.io
[twitter]:http://twitter.com/eyecatchio
