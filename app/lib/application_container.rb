# frozen_string_literal: true

class ApplicationContainer
  extend Dry::Container::Mixin

  register :redis do
    @register_redis ||= ConnectionPool::Wrapper.new { Redis.new(url: ENV.fetch('REDIS_URL', 'redis://127.0.0.1:6379')) }
  end

  # register :
end
