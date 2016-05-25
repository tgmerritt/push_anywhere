require 'faker'

class FakeCustomerRecord

  def initialize
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
        "membershipNo":           Faker::Number.number(10),
        "vatRegistrationNumber":  Faker::Number.number(9),
        # "title":                  Faker::Name.prefix,
        "position":               "",
        "stage":                  "SUSPECT",
        "mobile":                 Faker::PhoneNumber.cell_phone,
        "phone":                  Faker::PhoneNumber.phone_number,
        "fax":                    Faker::PhoneNumber.phone_number,
        "email":                  Faker::Internet.email,
        "webSite":                Faker::Internet.url,
        "status":                 "ACTIVE",
        "remark":                 Faker::Hacker.say_something_smart,
        "creditLimit":            Faker::Number.decimal(4, 2),
        "creditLimitThreshold":   Faker::Number.decimal(3, 2),
        "language":               {
            "code": "en-US"
        },
        "gender":                 ["MALE", "FEMALE"].sample,
        "marketingStatus":        "SUBSCRIBED",
        "taxType":                "LIABLE"
        # Address is read-only and there is no existing endpoint for a CREATE as of May 25, 2016
        # "customerAddressLines":   [
        #                               {
        #                                   "address":           {
        #                                       "countryCode":   Faker::Address.country_code,
        #                                       "stateCode":     Faker::Address.state_abbr,
        #                                       "state":         Faker::Address.state,
        #                                       "cityName":      Faker::Address.city,
        #                                       "street1":       Faker::Address.street_address,
        #                                       "street2":       Faker::Address.secondary_address,
        #                                       "zipCode":       Faker::Address.postcode,
        #                                       "mobile":        Faker::PhoneNumber.cell_phone,
        #                                       "telephone":     Faker::PhoneNumber.cell_phone,
        #                                       "recipientName": Faker::Name.name,
        #                                       "displayName":   "#{Faker::Name.name} #{Faker::Address.street_address} #{Faker::Address.secondary_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.postcode} #{Faker::Address.country} Cel: #{Faker::PhoneNumber.cell_phone} Tel: #{Faker::PhoneNumber.cell_phone}"
        #                                   },
        #                                   "defaultBillingTo":  true,
        #                                   "defaultShippingTo": true
        #                               }
        #                           ]
    }
  end
end