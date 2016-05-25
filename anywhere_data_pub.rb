#!/usr/bin/env ruby

require 'rest-client'
require 'json'
require 'fake_anywhere_data'

class PushAnywhere

  def initialize
    puts "Welcome to the SAP Anywhere fake data publishing utility!"
    run_step_1
  end

  def run_step_1
    puts "Please choose from the following options:"
    puts "1. Get a refresh token (API authorization)"
    puts "2. Make an API request"
    puts "3. Generate Fake Data!"
    puts "Q to quit"
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
    elsif input == "2"
      run_api_menu
    elsif input == "3"
      run_fake_data
    elsif "Q".casecmp(input) == 0
      exit
    else
      you_screwed_up
    end
  end

  def run_api_menu
    puts "Would you like to GET, POST, or PATCH ?  Please type GET, POST, or PATCH below:\n"
    action = gets.chomp
    # Could re-write with CASE
    if action == "GET"
      run_new_get
    elsif action == "POST"
      run_new_post
    elsif action == "PATCH"
      run_new_patch
    elsif action == "DELETE"
      puts "I didn't implement DELETE on purpose - you're trolling...\n\n"
      run_step_1
    else
      puts "That is not a valid option!"
      run_step_1
    end
  end

  def run_new_get
    puts "Type in the endpoint you'd like to access, for example Customers or Customers/count"
    puts "The initial / before the endpoint is unnecessary, but a sub endpoint requires the /"
    puts "Do not type a / at the end of a top-level endpoint, e.g. Do NOT type Customers/ - just type Customers"
    puts "For a full list of available endpoints - https://doc-us.sapanywhere.com"
    puts "You'll have a chance to enter the ID of a record after entering the initial endpoint (optional)"
    endpoint = gets.chomp
    puts "ID of an individual record? (enter for none)"
    record_id = gets.chomp
    text      = record_id.empty? ? "Making GET request to #{endpoint}" : "Making GET request to #{endpoint} for record # #{record_id}"
    puts text
    make_get_request(endpoint, record_id)
  end

  def run_new_post
    puts "Type in the endpoint you'd like to access, for example Customers or Customers/count"
    puts "The initial / before the endpoint is unnecessary, but a sub endpoint requires the /"
    puts "Do not type a / at the end of a top-level endpoint, e.g. Do NOT type Customers/ - just type Customers"
    puts "For a full list of available endpoints - https://doc-us.sapanywhere.com"
    endpoint = gets.chomp
    puts "Paste in the JSON you'd like to POST on the next line (it's a script utility - implement intelligence yourself!)"
    body = gets.chomp.to_json
    puts "Making POST request to #{endpoint}"
    make_post_request(endpoint, body)
  end

  def run_new_patch
    puts "Type in the endpoint you'd like to access, for example Customers or Customers/count"
    puts "The initial / before the endpoint is unnecessary, but a sub endpoint requires the /"
    puts "Do not type a / at the end of a top-level endpoint, e.g. Do NOT type Customers/ - just type Customers"
    puts "For a full list of available endpoints - https://doc-us.sapanywhere.com"
    endpoint = gets.chomp
    puts "Enter the ID of the record you'd like to update"
    record_id = gets.chomp
    puts "Paste in the JSON you'd like to POST on the next line (it's a script utility - implement intelligence yourself!)"
    body = gets.chomp.to_json
    puts "Making PATCH request to #{endpoint}"
    make_patch_request(endpoint, record_id, body)
  end

  def run_fake_data
    FakeAnywhereData.new(@access_token)
  end

  def make_get_request(endpoint, record_id)
    target   = record_id.empty? ? endpoint : "#{endpoint}/#{record_id}"
    response = RestClient.get "https://api-us.sapanywhere.com:443/v1/#{target}?access_token=#{@access_token}", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    puts JSON.pretty_generate(JSON.parse(response))
    puts "\n\n\n"
    sleep(1)
    run_step_1
  end

  def make_post_request(endpoint, body)
    response = RestClient.post "https://api-us.sapanywhere.com:443/v1/#{endpoint}?access_token=#{@access_token}", body, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    puts JSON.pretty_generate(response)
    puts "\n\n\n"
    sleep(1)
    run_step_1
  end

  def make_patch_request(endpoint, record_id, body)
    response = RestClient.patch "https://api-us.sapanywhere.com:443/v1/#{endpoint}/#{record_id}?access_token=#{@access_token}", body, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    puts JSON.pretty_generate(response)
    puts "\n\n\n"
    sleep(1)
    run_step_1
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
    RestClient.post 'https://accounts-us.sapanywhere.com:443/sld/oauth2/token', :client_id => @api_key, :client_secret => @api_secret, :refresh_token => @refresh_token, :grant_type => 'refresh_token'
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

  def you_screwed_up
    puts "Seriously?  You had four choices and you messed up?\n"
    sleep(5)
    puts "Intentional delay - you waste my time I waste yours.\n\n\n"
    sleep(2)
    run_step_1
  end

end

PushAnywhere.new
