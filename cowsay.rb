require 'cowsay'
require 'sinatra'

before do
    content_type 'text/plain'
end

get '/' do
    redirect '/this%20is%20an%20example'
end

get '/*/*' do
    cow = params[:splat][0].intern
    cows = Cowsay::Character.constants - [:Base]
    if cows.include? cow
        message = params[:splat][1]
        c = Cowsay::Character.const_get(cow).new
        c.say(message)
    end 
end

get '/:message' do
    cow = Cowsay::Character.const_get(:Cow).new
    cow.say(params[:message])
end
