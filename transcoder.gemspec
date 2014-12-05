$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "transcoder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "transcoder"
  s.version     = Transcoder::VERSION
  s.authors     = ["Vlatko Trajkov"]
  s.email       = ["trajkovvlatko@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary"
  s.description = "Description"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.7"
  s.add_dependency "resque"
  s.add_dependency "redis"
  s.add_dependency "httparty"

  s.add_development_dependency "sqlite3"
end
