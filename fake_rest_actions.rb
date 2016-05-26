require 'rest-client'
require 'json'
require_relative 'fake_sales_order'

class FakeRestActions
  attr_accessor :body, :endpoint, :record_id, :access_token

  def initialize(args)
    @body         = args[:body] || ""
    @endpoint     = args[:endpoint] || ""
    @record_id    = args[:record_id] || ""
    @access_token = args[:access_token] || ""
  end

  def get_request
    target   = @record_id.empty? ? @endpoint : "#{@endpoint}/#{@record_id}"
    RestClient.get "https://api-us.sapanywhere.com:443/v1/#{target}?access_token=#{@access_token}&expand=*", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
  end

  def post_request
    begin
      response = RestClient.post("https://api-us.sapanywhere.com:443/v1/#{@endpoint}?access_token=#{@access_token}", @body.to_json, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json', :content_type => 'application/json;charset=UTF-8' })
    rescue => e
      puts e.response
      puts "\n\n"
    end
    puts "\n\n"
    puts "#{endpoint.capitalize} created successfully!"
    puts "\n\n"
    sleep(1)
  end

  def patch_request
    response = RestClient.patch "https://api-us.sapanywhere.com:443/v1/#{@endpoint}/#{@record_id}?access_token=#{@access_token}", @body, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    puts JSON.pretty_generate(response)
    puts "\n\n\n"
    sleep(1)
  end

  def get_possible_customers
    response = RestClient.get "https://api-us.sapanywhere.com:443/v1/Customers?access_token=#{@access_token}&select=id,customerName,customerCode", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    (JSON.parse(response)).reject { |h| h['customerName'].nil? }
  end

  def get_possible_skus
    response = RestClient.get "https://api-us.sapanywhere.com:443/v1/SKUs?access_token=#{@access_token}&select=id,name,code", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    JSON.parse(response)
  end
end