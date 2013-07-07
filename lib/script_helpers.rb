require "script_helpers/version"
require File.expand_path("../../app/helpers/script_helpers/script_and_css_helper.rb", __FILE__)

module ScriptHelpers
  module Rails
    class Engine < ::Rails::Engine
      config.to_prepare do
        ActionController::Base.helper ScriptHelpers::ScriptAndCssHelper
      end
    end
  end
end
