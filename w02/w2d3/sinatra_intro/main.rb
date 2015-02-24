require 'sinatra'
require 'sinatra/contrib/all'

get '/' do
	puts "I am the root - you'll see me in the logs"
	"This is the route of the app"
end

get '/hi' do
	"Hello world!"
end

get '/name/:first' do
	"your name is #{params[:first]}"
end

get '/name/:first/:last/:age' do
	"your name is #{params['first']} #{params[:last]} and you are #{params[:age]}"
end

get '/multiply/:x/:y' do
	result = params[:x].to_f * params[:y].to_f
	puts result
	"the result of #{params[:x]} x #{params[:y]} = #{result}"
end
