# Transcoder Rails Engine

Add to Gemfile:
```
gem 'transcoder', git: 'git@github.com:trajkovvlatko/transcoder-rails-engine.git', branch: 'master'
```

Run:
```
bundle install
```

Mount in your application:
```
mount Transcoder::Engine, :at => "transcoder"
```

Send POST request to "http://localhost:3000/transcoder/videos/transcode" with json:

```
{
  "input":"/home/vlatko/Videos/Testing/originals/1.mp4", 
  "outputs":[
    {
      "url":"/home/vlatko/test/video/hi/hi.mp4", 
      "width":"1280", 
      "height":"720", 
      "audio_codec":"aac", 
      "video_codec":"h264", 
      "single_thread":false
    }, 
    {
      "url":"/home/vlatko/test/video/low/low.mp4", 
      "width":"640", 
      "height":"360", 
      "audio_codec":"aac", 
      "video_codec":"h264", 
      "single_thread":false
    }, 
    {
      "url":"/home/vlatko/test/video/ts/ts.ts", 
      "width":"1280", 
      "height":"720", 
      "audio_codec":"aac", 
      "audio_bitrate":"192k", 
      "video_codec":"h264", 
      "single_thread":false
    }, 
    {
      "url":"/home/vlatko/test/video/thumbs/0%d.jpg", 
      "width":"1280", 
      "height":"720", 
      "quantity":5, 
      "single_thread":false
    }
  ], 
  "config": 
    { 
      "video_id": "123", 
      "progress_url" : "http://localhost:3000/statuses/progress", 
      "success_url" : "http://localhost:3000/statuses/success", 
      "fail_url" : "http://localhost:3000/statuses/fail" 
    } 
}
```

Paths will be auto created and overwritten.
