$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

require 'yaml'
require 'ostruct'
require 'bundler'

Bundler.require
Bundler.require(:development) if ENV['RELAY_ALCHEMY_ENV'] == 'development'

require 'multi_json'
require 'sinatra/json'
require 'active_support/hash_with_indifferent_access'
require 'alchemy_api'
require 'relay_alchemy'

configure do
  set :relay_alchemy_env, ENV['RELAY_ALCHEMY_ENV']
end

AlchemyAPI.key = ENV['RELAY_ALCHEMY_APIKEY']

helpers do
  # set instance vars
  # url helpers, etc
end

get '/alchemy/sentiment_analysis' do
  request = AlchemyAPI::SentimentAnalysis.new
  json request.search(RelayAlchemy::TextSentimentAnalysis.build_params(params))
end
