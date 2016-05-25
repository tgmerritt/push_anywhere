require_relative 'fake_customer_record'
require_relative 'fake_sales_order'
require_relative 'rest_actions'

class FakeAnywhereData

  def initialize(access_token)
    puts "\n\nLet's get ready to FAKE IT TIL WE MAKE IT\n\n"
    @access_token = access_token
    faker_step_1
  end

  def faker_step_1
    puts "Please choose from the following options:"
    puts "1. Seed 50 random records"
    puts "2. Create fake Customers"
    puts "3. Create fake Sales Orders"
    puts "Q to quit"
    get_first_fake_response
  end

  def get_first_fake_response
    input = gets.chomp
    analyze_fake_response(input)
  end

  def analyze_fake_response(input)
    if input == "1"
      randomize_records
    elsif input == "2"
      ready_customer_records
    elsif input == "3"
      ready_sales_order_records
    elsif "Q".casecmp(input) == 0
      exit
    else
      you_screwed_up
    end
  end

  def randomize_records
    puts "Due to the API throughput limitations, this may take some time..."
    exit
  end

  def ready_customer_records
    execute_customer_record_create(check_quantity)
  end

  def ready_sales_order_records
    execute_sales_order_create(check_quantity)
  end

  def check_quantity
    puts "How many records would you like to create? (Enter a number between 1 and 10)"
    qty = gets.chomp.to_i
    unless qty <= 10
      puts "\nI said between 1 and 10...\n"
      check_quantity # meta!
    end
    qty
  end

  def execute_customer_record_create(qty)
    puts "Starting to create Customer records...  Please give the API time to respond..."
    qty.times do |t|
      body = FakeCustomerRecord.new.generate
      RestActions.new(endpoint: "Customers", body: body, access_token: @access_token).post_request
    end
  end

  def execute_sales_order_create(qty)
    puts "Starting to create Sales Order records...  Please give the API time to respond..."
    r         = RestActions.new(access_token: @access_token)
    customers = r.get_possible_customers
    skus      = r.get_possible_skus
    1.times do |t|
      body = FakeSalesOrder.new(customers: customers, skus: skus, times: Random.new.rand(2..4)).generate
      # puts JSON.pretty_generate(JSON.parse(body.to_json))
      RestActions.new(endpoint: "SalesOrders", body: body, access_token: @access_token).post_request
    end

  end

  def you_screwed_up
    puts "Seriously?  Again??? You had four choices and you messed up?\n"
    sleep(5)
    puts "Intentional delay - you waste my time I waste yours.\n\n\n"
    sleep(2)
    puts "You need to start over"
    exit
  end


end