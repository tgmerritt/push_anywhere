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
                                          "name": "CASH",
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

# EXAMPLE
# {
#     "customFields": {
#         "ext_default_UDF1": "value",
#         "ext_default_UDF2": 12
#     },
#     "docNumber": "sample_docNumber",
#     "exchangeRate": 10.5,
#     "status": "OPEN",
#     "customer": {
#         "name": "sample_name",
#         "code": "sample_code"
#     },
#     "contactPerson": {},
#     "referenceNumber": "sample_referenceNumber",
#     "postingTime": "2015-09-22T06:10:00.000Z",
#     "creationTime": "2015-09-22T06:10:00.000Z",
#     "updateTime": "2015-09-22T06:10:00.000Z",
#     "amount": {
#         "amount": 10.5,
#         "amountLocalCurrency": 10.5
#     },
#     "rateDifference": 10.5,
#     "remark": "sample_remark",
#     "currency": {
#         "code": "sample_code",
#         "isoCode": "AUD"
#     },
#     "refunded": false,
#     "refundError": "sample_refundError",
#     "refundTransactionNumber": "sample_refundTransactionNumber",
#     "paymentLines": [
#                         {
#                             "customFields": {
#                                 "ext_default_UDF1": "value",
#                                 "ext_default_UDF2": 12
#                             },
#                             "number": 1,
#                             "transactionDocument": {
#                                 "number": "sample_number",
#                                 "type": "sample_type"
#                             },
#                             "totalAmount": {
#                                 "amount": 10.5,
#                                 "amountLocalCurrency": 10.5
#                             },
#                             "appliedAmount": {
#                                 "amount": 10.5,
#                                 "amountLocalCurrency": 10.5
#                             }
#                         }
#                     ],
#     "paymentMethodLines": [
#                         {
#                             "customFields": {
#                                 "ext_default_UDF1": "value",
#                                 "ext_default_UDF2": 12
#                             },
#                             "paymentMethod": {
#                                 "name": "sample_name",
#                                 "type": "PAYPAL_PRO"
#                             },
#                             "amount": {
#                                 "amount": 10.5,
#                                 "amountLocalCurrency": 10.5
#                             }
#                         }
#                     ]
# }