require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
  })
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/other_than_me.cgi', WEBrick::HTTPServlet::CGIHandler, 'other_than_me.rb')
server.mount('/poor_quality.cgi', WEBrick::HTTPServlet::CGIHandler, 'poor_quality.rb')
server.start
