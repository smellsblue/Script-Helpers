require "rubygems/package_task"
require File.expand_path("../lib/script_helpers/version", __FILE__)

Gem::Specification.new do |s|
  s.name         = "script_helpers"
  s.version      = ScriptHelpers::Version.to_s
  s.summary      = "Script Helpers"
  s.description  = "A Rails 3 gem that allows easy inlining of css and JavaScript"
  s.authors      = ["Mike Virata-Stone"]
  s.email        = "mike@virata-stone.com"
  s.files        = FileList["lib/**/*", "app/**/*"]
  s.license      = "MIT"
  s.require_path = "lib"
  s.homepage     = "https://github.com/mikestone/Script-Helpers"

  s.add_dependency "railties", ">= 3.0", "< 5.0"
end
