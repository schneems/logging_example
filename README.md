## Logging stops after a while (thread safety)

* [Issue](https://github.com/rails/rails/issues/14031)


Database setup:

```
RAILS_ENV=production bin/rake db:create
RAILS_ENV=production bin/rake db:migrate
```

Run the server (threaded with Puma):

```
bin/rails s -e production
```

Using an ab concurrency of 1 works as expected:

```
ab -n 300 -c 1 http://localhost.dev:3000/
```

Specifying concurrent requests causes logging to halt before ab finishes:

```
ab -n 300 -c 6 http://localhost.dev:3000/
```

The issue happens with [activerecord-session_store](https://github.com/rails/activerecord-session_store) loaded.

Without [rails_12factor](http://rubygems.org/gems/rails_12factor) it's necessary to use `tail -f log/production.log`, which does appear to work with an ab concurrency of 6.

I also tried using sqlite instead of pg but it was still working (sometimes?).


