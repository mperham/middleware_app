class PostsController < ApplicationController
  def index
    login unless User.current_id
    render plain: "You are now logged in as User #{User.current_id}"
  end

  def new
    SomeWorker.perform_async(1, 2)
    render plain: "Created job for user #{User.current_id}"
  end

  private

  def login
    cookies.signed[:user_id] = User.current_id = 123 # TODO Your authentication framework should handle login
  end
end
