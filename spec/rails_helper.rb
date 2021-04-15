require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

require 'rspec/rails'

# Capybara setup
require 'capybara/rails'
require 'webdrivers'
require 'selenium/webdriver'

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions': { args: %w[window-size=1280,800 headless disable-gpu] }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :chrome
Capybara.current_driver    = Capybara.javascript_driver

Capybara.configure do |config|
  config.always_include_port = true
  config.reuse_server = true
end
