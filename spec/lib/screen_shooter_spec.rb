require 'spec_helper'
require_relative '../../lib/screen_shooter'

describe ScreenShooter do

  before do
    fork do
      system("ruby #{File.join(Dir.pwd, 'spec', 'support', 'web_server.rb')}")
    end
  end

  after do
    Process.kill 'TERM', File.read('/tmp/test_web_server.pid').to_i
  end

  it 'should take a screenshot of the webpage' do
    s = ScreenShooter.new(:webkit)
    s.shoot('http://localhost:4567/test-app')
  end

end