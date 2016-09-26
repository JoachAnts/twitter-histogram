# app.rb
require 'sinatra'

get '/hello/:name' do
	"Hello #{params[:name]}"
end

get '/*' do
	'Try /hello/:name'
end
