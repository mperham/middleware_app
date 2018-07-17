require 'user_middleware'

# any process that is not a Sidekiq process
Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add UserClient
  end
end

# the Sidekiq process
Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add UserServer
  end
  config.client_middleware do |chain|
    chain.add UserClient
  end
end

