require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8"){
  get = cgi['goya']

  "<html>
    <body>
      <p>自家消費以外で売った相手のゴーヤの情報です</p>
      文字列：#{get}
    </body>
  </html>"
}
