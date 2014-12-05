module Transcoder

  class VideosController < ApplicationController

    require 'resque'
    require 'httparty'

    skip_before_filter :verify_authenticity_token, :only => [:transcode]

    def transcode
      input, outputs, config = params[:input], params[:outputs], params[:config]
      Path.create_paths(outputs)
      video = Ffmpeg.new(input, outputs, config)
      if video.probe
        Resque.enqueue(Transcoder::TranscoderWorker, video.id, video.command, video.duration, config)
      else
        # HTTParty.post(config["fail_url"], query: { status: "fail", video_id: config["video_id"] })
        # Publisher.fail(config)
      end
      render nothing: true
    end
  end

end
