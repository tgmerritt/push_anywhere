require 'faker'
require 'as-duration'

class FakeSalesOrder
  attr_accessor :customer, :skus, :times

  def initialize(args)
    @customer = args[:customers]
    @skus     = args[:skus]
    @times    = args[:times]
  end

  def create_product_lines
    productLines = []

    random = Random.new

    @times.times do |t|

      this_product = @skus.sample
      quantity     = random.rand(1..3)
      net          = random.rand(10.01..190.99).round(2)
      gross        = random.rand(10.01..190.99).round(2)
      standard     = random.rand(200.01..1000.99).round(2)
      discount     = random.rand(0.1..5.99).round(2)

      netAmount   = quantity * net
      grossAmount = quantity * gross

      productLines << {
          "quantity":        quantity,
          "netUnitPrice":    net,
          "grossUnitPrice":  gross,
          "standardPrice":   standard,
          "discount":        discount,
          "netAmount":       {
              "amount": netAmount
          },
          "grossAmount":     {
              "amount": grossAmount
          },
          "calculationBase": "BY_DEFAULT",
          "sku":             {
              "name": this_product['name'],
              "code": this_product['code']
          },
          "remark":          Faker::Hacker.say_something_smart,

      }
    end
    productLines
  end

  def generate
    c                    = customer.sample
    random               = Random.new
    base                 =
        {
            "channel":               {
                "name": "USA Direct Sales"
            },
            "customer":              {
                "name": c["customerName"],
                "code": c["customerCode"]
            },
            "contactPerson":         {},
            "orderTime":             Faker::Time.between(25.days.ago, 20.days.ago, :day).iso8601,
            "deliveryTime":          Faker::Time.between(6.days.ago, Date.today, :all).iso8601,
            "shippingTime":          Faker::Time.between(15.days.ago, 7.days.ago, :morning).iso8601,
            "carrier":               {
                "id":   1,
                "name": "FedEx"
            },
            "orderType":             "SELL_ORDER",
            "salesEmployee":         {
                "name": "Tyler Merritt"
            },
            "currency":              {
                "code":    "USD",
                "isoCode": "USD"
            },
            "pricingMethod":         "NET_PRICE",
            "shippingAddress":       {
                "countryCode":   "US",
                "stateCode":     Faker::Address.state_abbr,
                "state":         Faker::Address.state,
                "cityName":      Faker::Address.city,
                "street1":       Faker::Address.street_address,
                "street2":       Faker::Address.secondary_address,
                "zipCode":       Faker::Address.postcode,
                "mobile":        Faker::PhoneNumber.cell_phone,
                "telephone":     Faker::PhoneNumber.cell_phone,
                "recipientName": Faker::Name.name,
                "displayName":   "#{Faker::Name.name} #{Faker::Address.street_address} #{Faker::Address.secondary_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.postcode} US Cel: #{Faker::PhoneNumber.cell_phone} Tel: #{Faker::PhoneNumber.cell_phone}"
            },
            "billingAddress":        {
                "countryCode":   "US",
                "stateCode":     Faker::Address.state_abbr,
                "state":         Faker::Address.state,
                "cityName":      Faker::Address.city,
                "street1":       Faker::Address.street_address,
                "street2":       Faker::Address.secondary_address,
                "zipCode":       Faker::Address.postcode,
                "mobile":        Faker::PhoneNumber.cell_phone,
                "telephone":     Faker::PhoneNumber.cell_phone,
                "recipientName": Faker::Name.name,
                "displayName":   "#{Faker::Name.name} #{Faker::Address.street_address} #{Faker::Address.secondary_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.postcode} US Cel: #{Faker::PhoneNumber.cell_phone} Tel: #{Faker::PhoneNumber.cell_phone}"
            },
            "processorRemark":       Faker::Hacker.say_something_smart,
            "customerRemark":        Faker::Hacker.say_something_smart,
            "shippingLines":         [
                                         {
                                             "netAmount":   {
                                                 "amount": random.rand(5.01..10.99).round(2)
                                             },
                                             "grossAmount": {
                                                 "amount": random.rand(5.01..10.99).round(2)
                                             },
                                             "remark":      Faker::Hacker.say_something_smart,
                                         }
                                     ],
            "headerCalculationBase": "BY_DEFAULT"
        }
    base["productLines"] = create_product_lines
    base
  end
end