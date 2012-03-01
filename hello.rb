require 'sinatra'
require 'sinatra/reloader' if development?

oauth_access_token = ENV['OAUTH_ACCESS_TOKEN']
graph = Koala::Facebook::API.new(oauth_access_token)

get '/' do
  content_type 'application/json', :charset => 'utf-8'
  graph.get_object('me')
end

get '/about' do
  "Wooahh!"
end

=begin
require "bundler/setup"
require 'koala'
require 'ap'

# TODO: nous assurer que nous vérifions bien l'identité du serveur

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

oauth_access_token = ""
graph = Koala::Facebook::API.new(oauth_access_token)

friends = graph.get_connections('me', 'friends')

friends.each do |friend|
  ap friend

  ap graph.get_picture(friend['id'])

  abort("bye")

end
=end