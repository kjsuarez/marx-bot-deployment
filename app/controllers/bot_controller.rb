require 'sidekiq/api'
class BotController < ApplicationController
def index
    stats = Sidekiq::Stats.new
    unless(stats.enqueued > 0)
      puts "put bot call here"
      BotWorker.perform_async()
      queue = Sidekiq::Queue.new
      queue.each{|job| job.delete}
    end
end

end
