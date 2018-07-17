class UserClient
  def call(worker, job, queue, redis_pool=nil)
    x = job["user_id"] = User.current_id
    puts "Saving user_id #{x}"
    yield # enqueue the job
  end
end

class UserServer
  def call(worker, job, queue)
    x = User.current_id = job["user_id"]
    puts "Restoring user_id #{x}"
    yield # execute the job
  ensure
    User.current_id = nil
  end
end
