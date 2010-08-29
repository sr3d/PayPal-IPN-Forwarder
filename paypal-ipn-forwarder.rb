# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
#
# $ ruby heroku-sinatra-app.rb
#
require 'rubygems'
require 'sinatra'
require 'net/http'

configure :production do
end

get '/' do
  "Point your IPN here with ?url=http://callback_url"
  url       = params[:url]
  # res       = Net::HTTP.post_form(URI.parse(url), "google=asdf")  
  "posted to #{url}"
end

post '/' do
  url       = params[:url]
  raw_post  = request.env["rack.input"].read
  res       = Net::HTTP.post_form(URI.parse(url), raw_post)
end