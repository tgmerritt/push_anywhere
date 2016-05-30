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
                  "baseLineId":     key['id'],
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
                "baseId":         @sales_order['id'],
                "baseNumber":     '',
                "baseType":       "SalesOrder",
                "baseLineId":     @sales_order['shippingLines'][0]['id'],
                "baseLineNumber": ''
            },
            "remark":       Faker::Hipster.sentence
        }
    shippingLines
  end

end
