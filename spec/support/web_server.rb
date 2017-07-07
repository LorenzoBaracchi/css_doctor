require 'sinatra'

set :haml, :format => :html5

File.open('/tmp/test_web_server.pid', 'w') {|f| f.write Process.pid }

get '/test-app' do
  code = %{
!!! 5
%html
  %head
    %title A test web server
  %body
    %h1 Here is a title!
    %p ... and some text ...
  }
  haml code
end
