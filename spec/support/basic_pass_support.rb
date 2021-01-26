module BasicPassSupport
  def basic_pass(pass)
    username = ENV["BASIC_AUTH_USER"] 
    password = ENV["BASIC_AUTH_PASSWORD"]
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
end
