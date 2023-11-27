require 'rack'
require 'erb'
require_relative 'database'
require_relative 'initializers/graphql'

class App
  def call(env)
    case env['PATH_INFO']
    when '/graphql'
      handle_graphql_request(env)
    when '/'
      render_view('home.erb')
    when '/about'
      render_view('about.erb')
    else 
      [404, {"content-type" => "text/plain"}, ["Not Found"]]
    end
  end

  private

  def handle_graphql_request(env)
    request = Rack::Request.new(env)
    query_string = nil
  
    if request.post? && request.media_type == 'application/json'
      data = JSON.parse(request.body.read)
      query_string = data['query']
    elsif request.get?
      query_string = request.params['query']
    else
      return [400, {"content-type" => "text/plain"}, ["Invalid request method or content type"]]
    end
  
    if query_string
      result = EmulatorWarehouseSchema.execute(query_string)
      [200, {"content-type" => "application/json"}, [result.to_json]]
    else
      [400, {"content-type" => "text/plain"}, ["No query string was present"]]
    end
  end
  
  def render_view(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    template_content = File.read(path)
    erb_template = ERB.new(template_content)
    [200, {"content-type" => "text/html"}, [erb_template.result(binding)]]
  end
end