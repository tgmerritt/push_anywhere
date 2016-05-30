require 'rest-client'
require 'json'
require_relative 'fake_sales_order'
require_relative 'fake_record'

class FakeRestActions < FakeRecord
  attr_accessor :body, :endpoint, :record_id, :access_token

  def initialize(args)
    super args
  end

  def get_request
    target   = @record_id.empty? ? @endpoint : "#{@endpoint}/#{@record_id}"
    RestClient.get "https://api-us.sapanywhere.com:443/v1/#{target}?access_token=#{@access_token}&expand=*", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
  end

  def post_request
    begin
      response = RestClient.post("https://api-us.sapanywhere.com:443/v1/#{@endpoint}?access_token=#{@access_token}", @body.to_json, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json', :content_type => 'application/json;charset=UTF-8' })
      puts "\n\n"
      puts "#{endpoint.capitalize} created successfully!"
      puts "\n\n"
      sleep(1)
    rescue => e
      puts e.response
      puts "\n\n"
    end
  end

  def patch_request
    response = RestClient.patch "https://api-us.sapanywhere.com:443/v1/#{@endpoint}/#{@record_id}?access_token=#{@access_token}", @body, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    puts JSON.pretty_generate(response)
    puts "\n\n\n"
    sleep(1)
  end

  def get_recent_sales_orders(qty)
    JSON.parse(RestClient.get "https://api-us.sapanywhere.com:443/v1/SalesOrders?expand=*&orderBy=creationTime desc&limit=#{qty}&filter=invoicedTotal eq 0&access_token=#{@access_token}", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' })
  end

  def get_recent_sales_invoices(qty)
    JSON.parse(RestClient.get "https://api-us.sapanywhere.com:443/v1/SalesInvoices?expand=*&orderBy=creationTime desc&limit=#{qty}&access_token=#{@access_token}", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' })
  end

  def get_possible_customers
    response = RestClient.get "https://api-us.sapanywhere.com:443/v1/Customers?access_token=#{@access_token}&select=id,customerName,customerCode", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    (JSON.parse(response)).reject { |h| h['customerName'].nil? }
  end

  def get_possible_skus
    JSON.parse(RestClient.get "https://api-us.sapanywhere.com:443/v1/SKUs?access_token=#{@access_token}&select=id,name,code", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' })
  end
end