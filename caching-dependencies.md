Caching dependencies
====

After the very first time of building your project, Eyecatch will save your dependencies automatically.
Currently `node_modules` and `vendor/bundle` directories will be saved.
Saved caches will be deleted permanently after a week.

## Disable caching
You can disable automatic dependency caching by adding the line below in `eyecatch.rb`:
```
no_cache true
```

## Purge saved cache
Note that if `no_cache true` is set in `eyecatch.rb`, cached dependencies will be erased on
next building.
