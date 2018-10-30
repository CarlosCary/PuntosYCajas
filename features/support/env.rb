# Sinatra
ENV['RACK_ENV']='app'

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')
# Force the application name because polyglot breaks the auto-detection logic.


require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app=Test

class MyWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}

