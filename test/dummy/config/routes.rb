Rails.application.routes.draw do

  mount Transcoder::Engine => "/transcoder"
end
