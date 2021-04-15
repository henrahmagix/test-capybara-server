require 'rails_helper'

RSpec.describe 'Server port testing', type: :feature do
  before do
    puts "Test start! current_url=#{current_url} \"#{page.title}\""
    visit '/'
    puts "visited #{current_url} \"#{page.title}\"\n#{page.text}"

    puts "default_url_options:                  #{default_url_options}"
    puts "Capybara.reuse_server:                #{Capybara.reuse_server.inspect}"
    puts "Capybara.app_host:                    #{Capybara.app_host.inspect}"
    puts "Capybara.default_host        :        #{Capybara.default_host.inspect}"
    puts "Capybara.app        :                 #{Capybara.app}"
    puts "Capybara.server_host:                 #{Capybara.server_host.inspect}"
    puts "Capybara.server_port:                 #{Capybara.server_port.inspect}"
    puts "Capybara::Server.ports :              #{Capybara::Server.ports.inspect}"
    puts "Capybara.current_session.app:         #{Capybara.current_session.app}"
    puts "Capybara.current_session.server:      #{Capybara.current_session.server || 'nil'} (object_id: #{Capybara.current_session.server.object_id})"
    puts "Capybara.current_session.server.host: #{Capybara.current_session.server&.host.inspect}"
    puts "Capybara.current_session.server.port: #{Capybara.current_session.server&.port.inspect}"
    puts "Capybara.current_session.server_url:  #{Capybara.current_session.server_url.inspect}"
  end

  describe 'repeat visits' do
    3.times.each do |n|
      it "visit #{n + 1}" do
        visit '/'
        puts "visited #{current_url} \"#{page.title}\""
      end
    end
  end

end
