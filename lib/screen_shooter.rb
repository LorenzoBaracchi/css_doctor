require 'capybara'
require 'capybara-webkit'

class ScreenShooter

  def initialize(driver = :webkit)
    @driver = driver
  end

  def shoot(url)
    session = Capybara::Session.new(@driver)
    session.visit(url)
    sleep 5
    puts session.html
  end

end