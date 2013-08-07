require 'sinatra'
require 'cowsay'

before do
    content_type 'text/plain'
end

get '/' do
    redirect '/this%20is%20an%20example'
end

get '/:message' do
    cow = Cowsay::Character.const_get(:Cow).new
    cow.say(params[:message])
end
