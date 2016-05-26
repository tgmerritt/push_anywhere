require_relative 'fake_customer_record'
require_relative 'fake_sales_order'
require_relative 'fake_rest_actions'
require_relative 'fake_sales_invoice'
require_relative 'fake_sales_payment'

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
    puts "4. Create fake Invoices (requires Sales Order and Customer)"
    puts "5. Create fake Payments (requires Invoice and Customer)"
    puts "Q to quit\n"
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
    elsif input == "4"
      ready_invoice_records
    elsif input == "5"
      ready_payment_records
    elsif "Q".casecmp(input) == 0
      exit
    else
      you_screwed_up
    end
  end

  # Don't ask the user for record quantity, just randomly create 10 Customers, Sales Orders and Invoices
  def randomize_records
    puts "Due to the API throughput limitations, this may take some time...\n"

    10.times do |t|
      execute_customer_record_create(10)
    end

    10.times do |t|
      execute_sales_order_create(10)
    end

    10.times do |t|
      execute_invoice_create(10)
    end
    puts "Finished creating bulk records!"
    exit
  end

  # We ask the user to tell us how many records they want with these methods
  def ready_customer_records
    execute_customer_record_create(check_quantity)
  end

  def ready_sales_order_records
    execute_sales_order_create(check_quantity)
  end

  def ready_invoice_records
    execute_invoice_create(check_quantity)
  end

  def ready_payment_records
    execute_payment_create(check_quantity)
  end

  def check_quantity
    puts "How many records would you like to create? (Enter a number between 1 and 10)\n"
    qty = gets.chomp.to_i
    unless qty <= 10
      puts "\nI said between 1 and 10...\n"
      check_quantity # meta!
    end
    qty
  end

  # Execute record creation based in quantity input
  def execute_customer_record_create(qty)
    puts "Starting to create Customer records...  Please give the API time to respond...\n"
    qty.times do |t|
      body = FakeCustomerRecord.new.generate
      FakeRestActions.new(endpoint: "Customers", body: body, access_token: @access_token).post_request
    end
  end

  def execute_sales_order_create(qty)
    puts "Starting to create Sales Order records...  Please give the API time to respond...\n"
    r         = FakeRestActions.new(access_token: @access_token)
    customers = r.get_possible_customers
    skus      = r.get_possible_skus
    qty.times do |t|
      body = FakeSalesOrder.new(customers: customers, skus: skus, times: Random.new.rand(2..4)).generate
      # puts JSON.pretty_generate(JSON.parse(body.to_json))
      FakeRestActions.new(endpoint: "SalesOrders", body: body, access_token: @access_token).post_request
    end
  end

  def execute_invoice_create(qty)
    puts "Getting recent Sales Orders...\n"
    sales_orders = FakeRestActions.new(access_token: @access_token).get_recent_sales_orders(qty)
    sales_orders.each do |sales_order|
      puts "Getting associated Customer record for SalesOrder #{sales_order["id"]}\n"
      customer = JSON.parse(FakeRestActions.new(endpoint: "Customers", record_id: sales_order["customer"]["id"].to_s, access_token: @access_token).get_request)
      body     = FakeSalesInvoice.new(customer: customer, sales_order: sales_order).generate
      FakeRestActions.new(endpoint: "SalesInvoices", body: body, access_token: @access_token).post_request
    end
  end

  def execute_payment_create(qty)
    puts "Getting recent Invoices..."
    invoices = FakeRestActions.new(access_token: @access_token).get_recent_sales_invoices(qty)
    invoices.each do |invoice|
      puts "Getting associated Customer record for SalesInvoice #{invoice['id']}\n"
      customer = JSON.parse(FakeRestActions.new(endpoints: "Customers", record_id: invoice["customer"]["id"].to_s, access_token: @access_token).get_request)
      body = FakeSalesPayment.new(customer: customer, invoice: invoice).generate
      FakeRestActions.new(endpoint: "Payment", body: body, access_token: @access_token).post_request
    end
  end

  def you_screwed_up
    puts "Seriously?  Again??? You had 5 choices and you messed up?\n"
    sleep(3)
    puts "Intentional delay - you waste my time I waste yours.\n\n\n"
    sleep(2)
    puts "You need to start over\n"
    exit
  end


end