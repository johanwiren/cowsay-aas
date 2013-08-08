require 'cowsay'
require 'sinatra'

def available_cows
    (Cowsay::Character.constants - [:Base]).sort
end

before do
    content_type 'text/plain'
end

get '/' do
    msg = "Usage: http://#{request.env["HTTP_HOST"]}/<character>/message\n\n"
    msg += "Available characters: "
    msg += available_cows.join(" ")
    msg
end

get '/*/*' do
    cow = params[:splat][0].intern
    if available_cows.include? cow
        message = params[:splat][1]
    else
        message = "Unknown character '#{cow}'. Available characters: "
        message += available_cows.join(" ")
        cow = 'Cow'
    end
    c = Cowsay::Character.const_get(cow).new
    c.say(message)
end

get '/:message' do
    cow = Cowsay::Character.const_get(:Cow).new
    cow.say(params[:message])
end
