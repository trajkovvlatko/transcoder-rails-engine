module Transcoder

  class Publisher

    require 'httparty'

    def self.progress(id, progress)
      puts "#{id.to_s}: #{progress.to_s}%"
      Redis.current.hset("progress", id.to_s, progress.to_i)
    end

    def self.complete(id, config)
      self.progress(id, 100)
      HTTParty.post(config["success_url"], query: { status: "complete", video_id: config["video_id"] })
    end

    def self.fail(config)
      HTTParty.post(config["fail_url"], query: { status: "fail", video_id: config["video_id"] })
    end

  end

end
