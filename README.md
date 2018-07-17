# Middleware Demo

This Rails app shows basic usage of Sidekiq middleware.  See `lib/user_middleware.rb` and
`config/initializers/sidekiq.rb` for detail.

## Setup

1. Run `bundle`
2. Run `bundle exec rails s` in one terminal window to start the web.
3. Run `bundle exec sidekiq` in another terminal window to start Sidekiq.
4. Navigate to [http://localhost:3000/posts](http://localhost:3000/posts) to log in as a fake user.
5. Navigate to [http://localhost:3000/posts/new](http://localhost:3000/posts/new) to create a Sidekiq job.

## Expected Output

Once you've logged in, the middleware can access the current User ID.
When you create a Sidekiq job, the client middleware will save the User
ID. The server middleware will restore the User ID when executing
that job.

```
Started GET "/posts/new" for 127.0.0.1 at 2018-07-17 11:01:50 -0700
Processing by PostsController#new as HTML
**Saving user_id 123**
  Rendering text template
  Rendered text template (0.1ms)
Completed 200 OK in 598ms (Views: 34.4ms)
```

```
2018-07-17T18:01:51.337Z 24756 TID-owmne8r00 SomeWorker JID-ecc72db171d00577e3f8d911 INFO: start
**Restoring user_id 123**
2018-07-17T18:01:51.364Z 24756 TID-owmne8r00 SomeWorker JID-ecc72db171d00577e3f8d911 INFO: done: 0.027 sec
```
