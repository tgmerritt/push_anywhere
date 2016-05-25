require 'faker'

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
      net          = random.rand(1.01..19.99).round(2)
      gross        = random.rand(1.01..19.99).round(2)
      standard     = random.rand(20.01..100.99).round(2)
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
            "orderTime":             (Time.now - 10000000).iso8601,
            "deliveryTime":          (Time.now - 1000000).iso8601,
            "shippingTime":          (Time.now - 5000000).iso8601,
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

  #  EXAMPLE
  # {
  #     "customFields": {},
  #     "id": 29,
  #     "docNumber": "29",
  #     "exchangeRate": 1,
  #     "extOrderId": null,
  #     "channel": {
  #         "id": 1,
  #         "name": "USA Direct Sales"
  #     },
  #     "customer": {
  #         "id": 70,
  #         "name": "Tommy's Fashion Bike Store",
  #         "code": "119"
  #     },
  #     "contactPerson": null,
  #     "orderTime": "2014-10-01T07:58:00.000Z",
  #     "deliveryTime": "2014-10-01T07:58:00.000Z",
  #     "shippingTime": null,
  #     "status": "OPEN",
  #     "paymentStatus": "PARTIALLY_PAID",
  #     "invoicedTotal": 50976,
  #     "paidTotal": 50976,
  #     "fulfillmentMethod": null,
  #     "paymentType": null,
  #     "extMerchantInfo": null,
  #     "carrier": null,
  #     "campaign": null,
  #     "orderType": "SELL_ORDER",
  #     "promotion": null,
  #     "salesEmployee": null,
  #     "currency": {
  #         "code": "USD",
  #         "isoCode": "USD"
  #     },
  #     "pricingMethod": "NET_PRICE",
  #     "salesTotal": 56500,
  #     "netTotal": {
  #         "amount": 56500,
  #         "amountLocalCurrency": 56500
  #     },
  #     "grossTotal": {
  #         "amount": 56500,
  #         "amountLocalCurrency": 56500
  #     },
  #     "taxAmount": {
  #         "amount": 0,
  #         "amountLocalCurrency": 0
  #     },
  #     "discount": 0,
  #     "netDiscountSum": {
  #         "amount": 0,
  #         "amountLocalCurrency": 0
  #     },
  #     "grossDiscountSum": {
  #         "amount": 0,
  #         "amountLocalCurrency": 0
  #     },
  #     "totalWeight": 0,
  #     "shippingCost": 0,
  #     "shippingAddress": {
  #         "countryCode": null,
  #         "stateCode": null,
  #         "state": null,
  #         "cityName": null,
  #         "street1": "2000 Shoreline",
  #         "street2": null,
  #         "zipCode": null,
  #         "mobile": null,
  #         "telephone": null,
  #         "recipientName": "Tommy's Fashion Bike Store",
  #         "displayName": "United States California  2000 Shoreline   Tommy's Fashion Bike Store "
  #     },
  #     "billingAddress": {
  #         "countryCode": null,
  #         "stateCode": null,
  #         "state": null,
  #         "cityName": null,
  #         "street1": "2000 Shoreline",
  #         "street2": null,
  #         "zipCode": null,
  #         "mobile": null,
  #         "telephone": null,
  #         "recipientName": "Tommy's Fashion Bike Store",
  #         "displayName": "United States California  2000 Shoreline   Tommy's Fashion Bike Store "
  #     },
  #     "processorRemark": null,
  #     "customerRemark": null,
  #     "grossProfitMargin": 100,
  #     "grossProfitAmount": 56500,
  #     "productLines": [
  #                         {
  #                             "customFields": {},
  #                             "id": 51,
  #                             "lineNumber": 1,
  #                             "quantity": 30,
  #                             "salesUom": {
  #                                 "id": 1,
  #                                 "name": null
  #                             },
  #                             "uomConversionRate": 1,
  #                             "inventoryUomQuantity": 30,
  #                             "inventoryUom": {
  #                                 "id": 1,
  #                                 "name": null
  #                             },
  #                             "netUnitPrice": 310,
  #                             "grossUnitPrice": 310,
  #                             "standardPrice": null,
  #                             "variants": "Black/47cm",
  #                             "discount": 0,
  #                             "estimatedTax": {
  #                                 "amount": 0,
  #                                 "amountLocalCurrency": 0
  #                             },
  #                             "netAmount": {
  #                                 "amount": 9300,
  #                                 "amountLocalCurrency": 9300
  #                             },
  #                             "grossAmount": {
  #                                 "amount": 9300,
  #                                 "amountLocalCurrency": 9300
  #                             },
  #                             "calculationBase": "BY_DEFAULT",
  #                             "costingMethod": "PURCHASE_PRICE",
  #                             "grossProfitMargin": 100,
  #                             "grossProfitAmount": 9300,
  #                             "estimatedUnitCost": 0,
  #                             "estimatedTotalCost": 0,
  #                             "sku": {
  #                                 "id": 13,
  #                                 "name": "F550-Black-47cm",
  #                                 "code": "F00001-BL-47"
  #                             },
  #                             "warehouse": {
  #                                 "id": 3,
  #                                 "name": "China Warehouse",
  #                                 "code": "China Warehouse"
  #                             },
  #                             "logisticsStatus": "DELIVERED",
  #                             "invoiceStatus": "NOT_INVOICED",
  #                             "exception": null,
  #                             "isPreparingStock": false,
  #                             "remark": null,
  #                             "detailedTaxInfo": []
  #                         },
  #                         {
  #                             "customFields": {},
  #                             "id": 52,
  #                             "lineNumber": 2,
  #                             "quantity": 80,
  #                             "salesUom": {
  #                                 "id": 1,
  #                                 "name": null
  #                             },
  #                             "uomConversionRate": 1,
  #                             "inventoryUomQuantity": 80,
  #                             "inventoryUom": {
  #                                 "id": 1,
  #                                 "name": null
  #                             },
  #                             "netUnitPrice": 590,
  #                             "grossUnitPrice": 590,
  #                             "standardPrice": null,
  #                             "variants": "59cm",
  #                             "discount": 0,
  #                             "estimatedTax": {
  #                                 "amount": 0,
  #                                 "amountLocalCurrency": 0
  #                             },
  #                             "netAmount": {
  #                                 "amount": 47200,
  #                                 "amountLocalCurrency": 47200
  #                             },
  #                             "grossAmount": {
  #                                 "amount": 47200,
  #                                 "amountLocalCurrency": 47200
  #                             },
  #                             "calculationBase": "BY_DEFAULT",
  #                             "costingMethod": "PURCHASE_PRICE",
  #                             "grossProfitMargin": 100,
  #                             "grossProfitAmount": 47200,
  #                             "estimatedUnitCost": 0,
  #                             "estimatedTotalCost": 0,
  #                             "sku": {
  #                                 "id": 12,
  #                                 "name": "F550s-59cm",
  #                                 "code": "F00002-59"
  #                             },
  #                             "warehouse": {
  #                                 "id": 3,
  #                                 "name": "China Warehouse",
  #                                 "code": "China Warehouse"
  #                             },
  #                             "logisticsStatus": "DELIVERED",
  #                             "invoiceStatus": "INVOICED",
  #                             "exception": null,
  #                             "isPreparingStock": false,
  #                             "remark": null,
  #                             "detailedTaxInfo": []
  #                         }
  #                     ],
  #     "returnLines": [],
  #     "shippingLines": [],
  #     "detailedTaxInfo": [],
  #     "creationTime": "2015-05-01T08:00:39.774Z",
  #     "updateTime": "2015-05-01T08:02:52.833Z",
  #     "returnReason": null,
  #     "paymentTerm": null,
  #     "headerCalculationBase": "BY_DEFAULT",
  #     "owner": {
  #         "id": 1,
  #         "name": "Drew Bates"
  #     },
  #     "createdBy": {
  #         "id": 1,
  #         "name": "Drew Bates"
  #     },
  #     "updatedBy": {
  #         "id": 1,
  #         "name": "Drew Bates"
  #     }
  # }
end