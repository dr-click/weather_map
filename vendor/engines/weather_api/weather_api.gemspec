$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "weather_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "weather_api"
  s.version     = WeatherApi::VERSION
  s.authors     = ["Dr-Click"]
  s.email       = ["mostafa.ragab@espace.com.eg"]
  s.homepage    = "https://github.com/dr-click"
  s.summary     = "WeatherApi."
  s.description = "WeatherApi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
