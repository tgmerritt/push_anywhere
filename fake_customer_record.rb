require 'faker'

class FakeCustomerRecord

  def initialize(*args)
    @quantity = args['quantity']
  end

  def generate
    name       = Faker::Name.name
    first_name = name.split(/\W+/)[0]
    last_name  = name.split(/\W+/)[1]
    {
        "customerType":           "INDIVIDUAL_CUSTOMER",
        "customerName":           Faker::Name.name,
        "lastName":               last_name,
        "firstName":              first_name,
        "displayName":            name,
        "membershipNo":           Faker::Number.number(10),
        "vatRegistrationNumber":  Faker::Number.number(9),
        "title":                  Faker::Name.prefix,
        "position":               "",
        "stage":                  "SUSPECT",
        "mobile":                 Faker::PhoneNumber.cell_phone,
        "phone":                  Faker::PhoneNumber.phone_number,
        "fax":                    Faker::PhoneNumber.phone_number,
        "email":                  Faker::Internet.email,
        "webSite":                Faker::Internet.url,
        "status":                 "ACTIVE",
        "remark":                 Faker::Hacker.say_something_smart,
        "creditLimit":            Faker::Number.decimal(3, 2),
        "creditLimitThreshold":   Faker::Number.decimal(3, 2),
        "language":               {
            "code": "en-US"
        },
        "gender":                 ["MALE", "FEMALE"].sample,
        "dateOfBirth":            Faker::Date.backward(10950),
        "lastMarketingCampaign":  Faker::Date.backward(365),
        "marketingStatus":        "SUBSCRIBED",
        "taxType":                "LIABLE",
        "creationTime":           "2015-09-22T06:10:00.000Z",
        "updateTime":             "2015-09-22T06:10:00.000Z",
        "membershipEnabled":      false,
        "membershipBalance":      1,
        "membershipLevelInfo":    {
            "name": "sample_name"
        },
        "customerPriceListLines": [
                                      {
                                          "customFields": {
                                              "ext_default_UDF1": "value",
                                              "ext_default_UDF2": 12
                                          },
                                          "priceListId":  1
                                      }
                                  ],
        "customerAddressLines":   [
                                      {
                                          "address":           {
                                              "countryCode":   "US",
                                              "stateCode":     "CA",
                                              "state":         "Freistaat Bayern",
                                              "cityName":      "Pasadena",
                                              "street1":       "100 West California Boulevard",
                                              "street2":       "Room202 Building7",
                                              "zipCode":       "91105",
                                              "mobile":        "(626) 397-5000",
                                              "telephone":     "(626) 397-5000",
                                              "recipientName": "Peter Wright",
                                              "displayName":   "Peter Wright 100 West California Boulevard Room202 Building7 Pasadena California 91105 United States Cel: (626) 397-5000 Tel: (626) 397-5000"
                                          },
                                          "defaultBillingTo":  false,
                                          "defaultShippingTo": false
                                      }
                                  ]
    }
  end
end