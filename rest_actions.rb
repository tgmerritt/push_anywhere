require 'rest-client'
require 'json'

class RestActions
  attr_accessor :body, :endpoint, :record_id, :access_token

  def initialize(args)
    @body         = args[:body] || ""
    @endpoint     = args[:endpoint] || ""
    @record_id    = args[:record_id] || ""
    @access_token = args[:access_token] || ""
  end

  def get_request
    target   = @record_id.empty? ? @endpoint : "#{@endpoint}/#{@record_id}"
    response = RestClient.get "https://api-us.sapanywhere.com:443/v1/#{target}?access_token=#{@access_token}", { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    puts JSON.pretty_generate(JSON.parse(response))
    puts "\n\n\n"
    sleep(1)
  end

  def post_request
    begin
      response = RestClient.post("https://api-us.sapanywhere.com:443/v1/#{@endpoint}?access_token=#{@access_token}", @body.to_json, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json', :content_type => 'application/json;charset=UTF-8' })
    rescue => e
      puts e.response
      puts "\n\n"
    end
    puts "\n\n"
    puts "Customer #{response.body} created successfully!"
    puts "\n\n"
    sleep(1)
  end

  def patch_request
    response = RestClient.patch "https://api-us.sapanywhere.com:443/v1/#{@endpoint}/#{@record_id}?access_token=#{@access_token}", @body, { 'Authorization' => "Bearer #{@access_token}", 'Accept' => 'application/json' }
    puts JSON.pretty_generate(response)
    puts "\n\n\n"
    sleep(1)
  end
end