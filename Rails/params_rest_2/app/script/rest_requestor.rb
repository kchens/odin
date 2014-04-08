# app/script/rest_requestor.rb
require 'rest-client'
url = "http://localhost:3000/new"
puts RestClient.get(url)