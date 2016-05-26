require 'faker'
require 'as-duration'

class FakeSalesInvoice
  attr_accessor :customer, :sales_order

  def initialize(args)
    @customer      = args[:customer]
    @sales_order   = args[:sales_order]
  end

  def generate
    base                  = {
        "exchangeRate":    1,
        "postingTime":     Faker::Time.between(5.days.ago, Date.today, :day).iso8601,
        "dueTime":         Faker::Time.forward(30, :day).iso8601,
        "remark":          Faker::Hipster.sentence,
        "billingAddress":  {
            "countryCode":   "US",
            "state":         @sales_order['billingAddress']['state'],
            "cityName":      @sales_order['billingAddress']['cityName'],
            "street1":       @sales_order['billingAddress']['street1'],
            "street2":       @sales_order['billingAddress']['street2'],
            "zipCode":       @sales_order['billingAddress']['zipCode'],
            "mobile":        @sales_order['billingAddress']['mobile'],
            "telephone":     @sales_order['billingAddress']['telephone'],
            "recipientName": @sales_order['billingAddress']['recipientName'],
            "displayName":   @sales_order['billingAddress']['displayName']
        }
    }
    base['shippingLines'] = create_shipping_lines unless @sales_order['shippingLines'].empty?
    base['invoiceLines']  = create_invoice_lines
    base
  end

  def create_invoice_lines
    invoiceLines = []
    @sales_order['productLines'].each do |key|
      invoiceLines <<
          {
              "baseDocument":    {
                  "baseId":         @sales_order['id'],
                  "baseNumber":     '',
                  "baseType":       "SalesOrder",
                  "baseLineId":     @sales_order['id'],
                  "baseLineNumber": ''
              },
              "remark":          Faker::Hipster.sentence,
              "netUnitPrice":    key['sku']['netUnitPrice'],
              "grossUnitPrice":  key['sku']['grossUnitPrice']
          }
    end
    invoiceLines
  end

  def create_shipping_lines
    shippingLines = []
    shippingLines <<
        {
            "baseDocument": {
                "baseId":         @sales_order['shippingLines']['baseId'],
                "baseNumber":     null,
                "baseType":       "SalesOrder",
                "baseLineId":     @sales_order['shippingLines']['baseLineId'],
                "baseLineNumber": null
            },
            "remark":       Faker::Hipster.sentence
        }
    shippingLines
  end

end

# {
#     "customFields": {},
#     "id": 62,
#     "docNumber": "62",
#     "exchangeRate": 1,
#     "status": "CLOSED",
#     "paymentStatus": "FULLY_PAID",
#     "pricingMethod": "NET_PRICE",
#     "postingTime": "2015-05-06T15:03:00.000Z",
#     "dueTime": "2015-05-06T15:03:00.000Z",
#     "creationTime": "2015-05-06T15:03:38.461Z",
#     "updateTime": "2015-05-06T15:03:38.563Z",
#     "manuallyClosed": false,
#     "remark": null,
#     "netTotal": {
#         "amount": 1869,
#         "amountLocalCurrency": 1869
#     },
#     "grossTotal": {
#         "amount": 1869,
#         "amountLocalCurrency": 1869
#     },
#     "taxAmount": {
#         "amount": 0,
#         "amountLocalCurrency": 0
#     },
#     "amountDue": {
#         "amount": 0,
#         "amountLocalCurrency": 0
#     },
#     "customer": {
#         "id": 119,
#         "name": "Michael Renz",
#         "code": "178"
#     },
#     "contactPerson": null,
#     "currency": {
#         "code": "USD",
#         "isoCode": "USD"
#     },
#     "shippingAddress": {
#         "countryCode": null,
#         "stateCode": null,
#         "state": null,
#         "cityName": "Shanghai",
#         "street1": "Pudong Avenue",
#         "street2": "",
#         "zipCode": "200180",
#         "mobile": "1564342342",
#         "telephone": null,
#         "recipientName": "Michael",
#         "displayName": "China Shanghai Shanghai Pudong Avenue  (200180) Michael 1564342342"
#     },
#     "billingAddress": {
#         "countryCode": null,
#         "stateCode": null,
#         "state": null,
#         "cityName": "Shanghai",
#         "street1": "Pudong Avenue",
#         "street2": "",
#         "zipCode": "200180",
#         "mobile": "1564342342",
#         "telephone": null,
#         "recipientName": "Michael",
#         "displayName": "China Shanghai Shanghai Pudong Avenue  (200180) Michael 1564342342"
#     },
#     "invoiceLines": [
#                         {
#                             "customFields": {},
#                             "id": 77,
#                             "lineNumber": 1,
#                             "baseDocument": {
#                                 "baseId": 117,
#                                 "baseNumber": null,
#                                 "baseType": "SalesOrder",
#                                 "baseLineId": 197,
#                                 "baseLineNumber": null
#                             },
#                             "remark": null,
#                             "sku": {
#                                 "id": 33,
#                                 "name": "F5Pista-59cm",
#                                 "code": "B00004-59"
#                             },
#                             "quantity": 1,
#                             "salesUom": {
#                                 "id": 1,
#                                 "name": null
#                             },
#                             "inventoryUom": {
#                                 "id": 1,
#                                 "name": null
#                             },
#                             "uomConversionRate": 1,
#                             "inventoryUomQuantity": 1,
#                             "calculationBase": "BY_TOTAL",
#                             "netUnitPrice": 1859,
#                             "grossUnitPrice": 1859,
#                             "netAmount": {
#                                 "amount": 1859,
#                                 "amountLocalCurrency": 1859
#                             },
#                             "grossAmount": {
#                                 "amount": 1859,
#                                 "amountLocalCurrency": 1859
#                             },
#                             "taxAmount": {
#                                 "amount": 0,
#                                 "amountLocalCurrency": 0
#                             },
#                             "detailedTaxInfo": []
#                         }
#                     ],
#     "shippingLines": [
#                         {
#                             "customFields": {},
#                             "id": 23,
#                             "lineNumber": 2,
#                             "baseDocument": {
#                                 "baseId": 117,
#                                 "baseNumber": null,
#                                 "baseType": "SalesOrder",
#                                 "baseLineId": 198,
#                                 "baseLineNumber": null
#                             },
#                             "remark": null,
#                             "netAmount": {
#                                 "amount": 10,
#                                 "amountLocalCurrency": 10
#                             },
#                             "grossAmount": {
#                                 "amount": 10,
#                                 "amountLocalCurrency": 10
#                             },
#                             "taxAmount": {
#                                 "amount": 0,
#                                 "amountLocalCurrency": 0
#                             },
#                             "detailedTaxInfo": []
#                         }
#                     ],
#     "detailedTaxInfo": [],
#     "paymentTerm": null,
#     "createdBy": null,
#     "updatedBy": null
# }
