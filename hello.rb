require 'sinatra'
require 'sinatra/reloader' if development?
require 'koala'

# TODO: nous assurer que nous vérifions bien l'identité du serveur
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

oauth_access_token = ENV['OAUTH_ACCESS_TOKEN']
graph = Koala::Facebook::API.new(oauth_access_token)

get '/' do
  friends = graph.get_connections('me', 'friends')[0..49]
  pictures = graph.batch do |batch_api|
    friends.each do |friend|
      batch_api.get_picture(friend['id'])
    end
  end
  
  @friends = []

  friends.each_with_index do |f, index|
    friend = OpenStruct.new
    friend.name = f['name']
    friend.facebook_id = f['id']
    friend.picture_url = pictures[index]
    @friends << friend
  end

 erb :index
end

=begin
require "bundler/setup"
require 'koala'
require 'ap'


oauth_access_token = ""
graph = Koala::Facebook::API.new(oauth_access_token)

friends = graph.get_connections('me', 'friends')

friends.each do |friend|
  ap friend

  ap graph.get_picture(friend['id'])

  abort("bye")

end
=end