class SomeWorker
  include Sidekiq::Worker

  def perform(an_argument, another)
    if User.current.admin?
      puts "Admin user"
    else
      puts "Normal user"
    end
  end
end
