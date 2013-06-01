require 'sinatra'
require 'cowsay'

before do
    content_type 'text/plain'
end

get '/' do
    redirect '/this%20is%20an%20example'
end

get '/:message' do
    Cowsay.say(params[:message])
end
