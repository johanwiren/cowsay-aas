require 'sinatra'
require 'cowsay'

get '/:message' do
    Cowsay.say(params[:message])
end
