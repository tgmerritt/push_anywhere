#!/usr/bin/env ruby

require 'rest-client'
require 'json'

class PushAnywhere

  def initialize
    puts "Welcome to the SAP Anywhere fake data publishing utility!"
    run_step_1
  end

  def run_step_1
    puts "Please choose from the following options:"
    puts "1. Get a refresh token (API authorization)"
    puts "2. Make an API request"
    get_first_choice
  end

  def get_first_choice
    input = gets.chomp
    analyze_first_choice(input)
  end

  def analyze_first_choice(input)
    if input == "1"
      set_static_api_values
      # set_api_values
      is_response_valid?(authenticate_with_api)
      run_api_menu
    else
      run_api_menu
    end
  end

  def run_api_menu
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

  def set_api_values
    puts "Please paste in the following tokens as they are requested."
    puts "API Key:"
    @api_key = gets.chomp
    puts "API Secret:"
    @api_secret = gets.chomp
    puts "Refresh Token:"
    @refresh_token = gets.chomp
    authenticate_with_api
  end

  def authenticate_with_api
    RestClient.post 'https://eap-idp-us.sapanywhere.com:443/sld/oauth2/token', :client_id => @api_key, :client_secret => @api_secret, :refresh_token => @refresh_token, :grant_type => 'refresh_token'
  end

  def is_response_valid?(response)
    unless response.code == 200
      puts "Invalid credentials!  Please try again!"
      run_step_1
    end
    @access_token = JSON.parse(response)["access_token"]
  end

  def set_static_api_values
    @api_key       = '4660200588335353-7BppDmr4rnd3ZOXRbHMo6zAEfsRR9kZg'
    @api_secret    = 'vXNR_NXBVtXHUJsLjuMfnTMiWrwp'
    @refresh_token = '61c49b95-64df-4662-9cb0-cf078d02f69c'
  end

# response = RestClient.post 'https://eap-idp-us.sapanywhere.com:443/sld/oauth2/token',:client_id=>api_key,:client_secret=>api_secret,:refresh_token=>refresh_token,:grant_type=>'refresh_token'

# token = JSON.parse(response)["access_token"]

# puts "The extracted token is:" + token + "\n\n\n"

# data = RestClient.get "https://api-us.sapanywhere.com:443/v1/SalesOrders/633?access_token=#{@access_token}", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }

# puts "This is the result from the query: \n" + data

end

PushAnywhere.new
