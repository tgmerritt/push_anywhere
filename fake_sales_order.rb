require 'faker'

class FakeSalesOrder
  attr_accessor :customer, :skus, :times

  def initialize(*args)
    @customer = args[:customers]
    @skus     = args[:skus]
    @times    = args[:times]
  end

  def create_product_lines
    # "productLines":
    [
        {
            "quantity":             "12.345",
            "salesUom":             {
                "name": "bottle"
            },
            "netUnitPrice":         10.5,
            "grossUnitPrice":       10.5,
            "standardPrice":        10.5,
            "discount":             10.5,
            "netAmount":            {
                "amount":              10.5,
                "amountLocalCurrency": 10.5
            },
            "grossAmount":          {
                "amount":              10.5,
                "amountLocalCurrency": 10.5
            },
            "calculationBase":      "BY_DEFAULT",
            "sku":                  {
                "name": "Juice_Orange_Big",
                "code": "P001"
            },
            "remark":               Faker::Hacker.say_something_smart,

        }
    ]
  end

  def generate
    c                    = customer.sample
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
            "netTotal":              {
                "amount":              10.5,
                "amountLocalCurrency": 10.5
            },
            "grossTotal":            {
                "amount":              10.5,
                "amountLocalCurrency": 10.5
            },
            "taxAmount":             {
                "amount":              10.5,
                "amountLocalCurrency": 10.5
            },
            "discount":              10.5,
            "netDiscountSum":        {
                "amount":              10.5,
                "amountLocalCurrency": 10.5
            },
            "grossDiscountSum":      {
                "amount":              10.5,
                "amountLocalCurrency": 10.5
            },
            "totalWeight":           10.5,
            "shippingCost":          10.5,
            "shippingAddress":       {
                "countryCode":   Faker::Address.country_code,
                "stateCode":     Faker::Address.state_abbr,
                "state":         Faker::Address.state,
                "cityName":      Faker::Address.city,
                "street1":       Faker::Address.street_address,
                "street2":       Faker::Address.secondary_address,
                "zipCode":       Faker::Address.postcode,
                "mobile":        Faker::PhoneNumber.cell_phone,
                "telephone":     Faker::PhoneNumber.cell_phone,
                "recipientName": Faker::Name.name,
                "displayName":   "#{Faker::Name.name} #{Faker::Address.street_address} #{Faker::Address.secondary_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.postcode} #{Faker::Address.country} Cel: #{Faker::PhoneNumber.cell_phone} Tel: #{Faker::PhoneNumber.cell_phone}"
            },
            "billingAddress":        {
                "countryCode":   Faker::Address.country_code,
                "stateCode":     Faker::Address.state_abbr,
                "state":         Faker::Address.state,
                "cityName":      Faker::Address.city,
                "street1":       Faker::Address.street_address,
                "street2":       Faker::Address.secondary_address,
                "zipCode":       Faker::Address.postcode,
                "mobile":        Faker::PhoneNumber.cell_phone,
                "telephone":     Faker::PhoneNumber.cell_phone,
                "recipientName": Faker::Name.name,
                "displayName":   "#{Faker::Name.name} #{Faker::Address.street_address} #{Faker::Address.secondary_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.postcode} #{Faker::Address.country} Cel: #{Faker::PhoneNumber.cell_phone} Tel: #{Faker::PhoneNumber.cell_phone}"
            },
            "processorRemark":       "sample_processorRemark",
            "customerRemark":        "sample_customerRemark",
            "grossProfitMargin":     10.5,
            "grossProfitAmount":     10.5,

            "shippingLines":         [
                                         {
                                             "lineNumber":      1,
                                             "netAmount":       {
                                                 "amount":              10.5,
                                                 "amountLocalCurrency": 10.5
                                             },
                                             "grossAmount":     {
                                                 "amount":              10.5,
                                                 "amountLocalCurrency": 10.5
                                             },
                                             "estimatedTax":    {
                                                 "amount":              10.5,
                                                 "amountLocalCurrency": 10.5
                                             },
                                             "remark":          "sample_remark",
                                             "detailedTaxInfo": [
                                                                    {
                                                                        "name":                    "sample_name",
                                                                        "taxDocumentType":         "SALES",
                                                                        "country":                 "sample_country",
                                                                        "state":                   "sample_state",
                                                                        "city":                    "sample_city",
                                                                        "zipCode":                 "sample_zipCode",
                                                                        "validFor":                "ALL",
                                                                        "taxBusinessPartnerGroup": "LIABLE",
                                                                        "taxClass":                {
                                                                            "description": "Standard"
                                                                        },
                                                                        "rateType":                "RATIO",
                                                                        "rateValue":               10.5,
                                                                        "taxAmount":               10.5,
                                                                        "inputAmount":             10.5,
                                                                        "taxDefinitionId":         1,
                                                                        "taxDocumentKey":          1
                                                                    }
                                                                ]
                                         }
                                     ],
            "detailedTaxInfo":       [
                                         {
                                             "name":                    "sample_name",
                                             "taxDocumentType":         "SALES",
                                             "country":                 "US",
                                             "state":                   "TX",
                                             "city":                    "Dallas",
                                             "zipCode":                 "75078",
                                             "validFor":                "ALL",
                                             "taxBusinessPartnerGroup": "LIABLE",
                                             "taxClass":                {
                                                 "description": "Standard"
                                             },
                                             "rateType":                "RATIO",
                                             "rateValue":               10.5,
                                             "taxAmount":               10.5,
                                             "inputAmount":             10.5,
                                             "taxDefinitionId":         1,
                                             "taxDocumentKey":          1
                                         }
                                     ],
            "paymentTerm":           {
                "name": "sample_name"
            },
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