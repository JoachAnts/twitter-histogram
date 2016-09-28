# app.rb
require 'sinatra'
require 'twitter'
require 'json'
require 'dotenv'

Dotenv.load 'api_keys.env'

get '/histogram/:name' do

	client = Twitter::REST::Client.new do |config|
		config.consumer_key        = ENV['CONSUMER_KEY']
		config.consumer_secret     = ENV['CONSUMER_SECRET']
		config.access_token        = ENV['ACCESS_TOKEN']
		config.access_token_secret = ENV['ACCESS_SECRET']
	end
	
	# This will be compared to every tweet's creation datetime to ensure it's within the last 24 hours
	start_time = DateTime.now - 1.0
	
	# Initialize counts of all hours to 0
	count_hash = {}
	(0..23).each do |i| count_hash[i.to_s] = 0 end
	
	# Assumes that user has not made more than 60 tweets in the last 24 hours
	tweets = client.user_timeline("#{params[:name]}", count: 60)
	tweets.each do |tweet|
		tweet_time = DateTime.parse tweet.attrs[:created_at]
		# If true we have reached end of tweets from within the last 24 hours
		break if tweet_time < start_time
		
		count_hash[tweet_time.strftime "%-H"] += 1
	end

	return count_hash.to_json
	
end

get '/hello/:name' do
	"Hello #{params[:name]}"
end

get '/*' do
	'Try /hello/:name'
end
