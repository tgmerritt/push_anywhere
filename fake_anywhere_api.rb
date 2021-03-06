#!/usr/bin/env ruby

require 'rest-client'
require 'json'
require 'pry'
require_relative 'fake_anywhere_data'
require_relative 'fake_rest_actions'

class FakeAnywhereApi

  def initialize
    puts "Welcome to the SAP Anywhere fake data publishing utility!"
    puts "If you have not already done so, set the API Environment Variables (read the README in the project) and start this utility again"
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
      set_api_values
      is_response_valid?(authenticate_with_api)
      run_step_1
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
    response = FakeRestActions.new(endpoint: endpoint, record_id: record_id, access_token: @access_token).get_request
    puts JSON.pretty_generate(JSON.parse(response))
    puts "\n\n\n"
    sleep(1)
    run_step_1
  end

  def make_post_request(endpoint, body)
    FakeRestActions.new(endpoint: endpoint, body: body, access_token: @access_token)
    run_step_1
  end

  def make_patch_request(endpoint, record_id, body)
    FakeRestActions.new(endpoint: endpoint, record_id: record_id, body: body, access_token: @access_token)
    run_step_1
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
    puts "\n\nSuccess! Access Token is #{@access_token}\n\n"
  end

  def set_api_values
    @api_key       = ENV['SAP_ANW_API_KEY']
    @api_secret    = ENV['SAP_ANW_API_SECRET']
    @refresh_token = ENV['SAP_ANW_REFRESH_TOKEN']
  end

  def you_screwed_up
    puts "Seriously?  You had four choices and you messed up?\n"
    sleep(5)
    puts "Intentional delay - you waste my time I waste yours.\n\n\n"
    sleep(2)
    run_step_1
  end

end

FakeAnywhereApi.new
