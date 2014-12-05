Transcoder::Engine.routes.draw do

  match 'videos/transcode' => 'videos#transcode', :via => [:post]

  require 'resque/server'

  mount Resque::Server.new, at: "/resque", :via => [:get]

end
