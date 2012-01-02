require 'sinatra/base'
require 'rdiscount'

class App < Sinatra::Base
  set :environment, ENV['RACK_ENV']
  enable :inline_templates


  get "/" do
    markdown :index, :layout_engine => :erb
  end

  get "/*" do |page|
    markdown page.to_sym, :layout_engine => :erb
  end
end

__END__

@@ layout
<!DOCTYPE>
<html>
<head><title>SecureKey</title>
<link rel="stylesheet" type="text/css" href="/css/markdown.css">
</head>
<body>
<%= yield %>
</body>
</html>
