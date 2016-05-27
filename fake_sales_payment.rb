class FakeSalesPayment
  attr_accessor :customer, :invoice

  def initialize(args)
    @customer = args[:customer]
    @invoice  = args[:invoice]
  end

  def generate
    {
        "customer":           {
            "name": @customer['displayName'],
            "code": @customer['customerCode']
        },
        "postingTime":        Faker::Time.forward(3, :morning).iso8601,
        "remark":             Faker::Hipster.sentence,
        "currency":           {
            "code":    "USD",
            "isoCode": "USD"
        },
        "refunded":           false,
        "paymentLines":       [
                                  {
                                      "transactionDocument": {
                                          "id":   @invoice['id'],
                                          "type": "Invoice"
                                      },
                                      "appliedAmount":       {
                                          "amount": @invoice['grossTotal']['amount'],
                                      }
                                  }
                              ],
        "paymentMethodLines": [
                                  {
                                      "paymentMethod": {
                                          "name": "Cash",
                                          "type": "CASH"
                                      },
                                      "amount":        {
                                          "amount": @invoice['grossTotal']['amount'],
                                      }
                                  }
                              ]
    }
  end
end