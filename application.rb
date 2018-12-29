require 'erb'
require 'sinatra'
require 'twitter'
require 'dotenv'

Dotenv.load

get '/' do
  erb :new_tweet
end

post '/tweet' do
  client.update(params[:text])

  erb :new_tweet
end

def client
  Twitter::REST::Client.new(
    consumer_key: ENV['CONSUMER_KEY'],
    consumer_secret: ENV['CONSUMER_SECRET'],
    access_token: ENV['ACCESS_TOKEN'],
    access_token_secret: ENV['ACCESS_TOKEN_SECRET']
  )
end
