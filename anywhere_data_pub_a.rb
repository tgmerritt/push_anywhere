#!/usr/bin/env ruby

  require 'rest-client'
  require 'json'

    puts "Welcome to the SAP Anywhere fake data publishing utility!"
    puts "Please choose from the following options:"
    puts "1. Get a refresh token (API authorization)"
    puts "2. Make an API request"
    input = gets.chomp
    if input == "1"
      puts "we entered step 1"
      # puts "Please paste in the following tokens as they are requested."
      # puts "API Key:"
      # api_key = gets.chomp
      # puts "API Secret:"
      # api_secret = gets.chomp
      # puts "Refresh Token:"
      # refresh_token = gets.chomp
      api_key = '4660200588335353-7BppDmr4rnd3ZOXRbHMo6zAEfsRR9kZg'
      api_secret = 'vXNR_NXBVtXHUJsLjuMfnTMiWrwp'
      refresh_token = '61c49b95-64df-4662-9cb0-cf078d02f69c'

      response = RestClient.post 'https://eap-idp-us.sapanywhere.com:443/sld/oauth2/token', :client_id => api_key, :client_secret => api_secret, :refresh_token => refresh_token, :grant_type => 'refresh_token'
      puts "Invalid credentials!  Please try again!" unless response.code == 200
      @token = JSON.parse(response)["access_token"]
      puts @token
    else
      puts "Would you like to GET, POST, or PATCH ?  Please type GET, POST, or PATCH below:"
      action = gets.chomp
      if action == "GET"
        puts "pending"
      elsif action == "POST"
        puts "pending"
      elsif action == "PATCH"
        puts "pending"
      else
        puts "That is not a valid option!"
      end
    end


# response = RestClient.post 'https://eap-idp-us.sapanywhere.com:443/sld/oauth2/token',:client_id=>api_key,:client_secret=>api_secret,:refresh_token=>refresh_token,:grant_type=>'refresh_token'

# token = JSON.parse(response)["access_token"]

# puts "The extracted token is:" + token + "\n\n\n"

# data = RestClient.get "https://api-us.sapanywhere.com:443/v1/SalesOrders/633?access_token=#{token}", { 'Authorization' => "Bearer #{token}", 'Accept' => 'application/json' }

# puts "This is the result from the query: \n" + data
