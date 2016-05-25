require 'faker'

class FakeSalesOrder
  def initialize(*args)
    @customer = args['customer']
    @products = args['products']
  end

  def generate
    {
        "customFields": {
            "ext_default_UDF1": "value",
            "ext_default_UDF2": 12
        },
        "docNumber": "sample_docNumber",
        "exchangeRate": 10.5,
        "extOrderId": "sample_extOrderId",
        "channel": {
            "name": "sample_name"
        },
        "customer": {
            "name": "sample_name",
            "code": "sample_code"
        },
        "contactPerson": {},
        "orderTime": "2015-09-22T06:10:00.000Z",
        "deliveryTime": "2015-09-22T06:10:00.000Z",
        "shippingTime": "2015-09-22T06:10:00.000Z",
        "status": "CANCEL",
        "paymentStatus": "PARTIALLY_PAID",
        "invoicedTotal": 10.5,
        "paidTotal": 10.5,
        "fulfillmentMethod": {
            "code": "sample_code",
            "name": "sample_name"
        },
        "paymentType": {
            "code": "sample_code",
            "name": "sample_name"
        },
        "extMerchantInfo": {
            "shipServiceLevel": "STANDARD",
            "earliestShipTime": "2015-09-22T06:10:00.000Z",
            "earliestDeliveryTime": "2015-09-22T06:10:00.000Z",
            "merchantFulfillmentID": "sample_merchantFulfillmentID",
            "shipperTrackingNumber": "sample_shipperTrackingNumber"
        },
        "carrier": {
            "name": "sample_name"
        },
        "campaign": {},
        "orderType": "SELL_ORDER",
        "promotion": {
            "description": "sample_description",
            "itemId": 1
        },
        "salesEmployee": {
            "name": "sample_name"
        },
        "currency": {
            "code": "sample_code",
            "isoCode": "AUD"
        },
        "pricingMethod": "NET_PRICE",
        "salesTotal": 10.5,
        "netTotal": {
            "amount": 10.5,
            "amountLocalCurrency": 10.5
        },
        "grossTotal": {
            "amount": 10.5,
            "amountLocalCurrency": 10.5
        },
        "taxAmount": {
            "amount": 10.5,
            "amountLocalCurrency": 10.5
        },
        "discount": 10.5,
        "netDiscountSum": {
            "amount": 10.5,
            "amountLocalCurrency": 10.5
        },
        "grossDiscountSum": {
            "amount": 10.5,
            "amountLocalCurrency": 10.5
        },
        "totalWeight": 10.5,
        "shippingCost": 10.5,
        "shippingAddress": {
            "countryCode": "US",
            "stateCode": "CA",
            "state": "Freistaat Bayern",
            "cityName": "Pasadena",
            "street1": "100 West California Boulevard",
            "street2": "Room202 Building7",
            "zipCode": "91105",
            "mobile": "(626) 397-5000",
            "telephone": "(626) 397-5000",
            "recipientName": "Peter Wright",
            "displayName": "Peter Wright 100 West California Boulevard Room202 Building7 Pasadena California 91105 United States Cel: (626) 397-5000 Tel: (626) 397-5000"
        },
        "billingAddress": {
            "countryCode": "US",
            "stateCode": "CA",
            "state": "Freistaat Bayern",
            "cityName": "Pasadena",
            "street1": "100 West California Boulevard",
            "street2": "Room202 Building7",
            "zipCode": "91105",
            "mobile": "(626) 397-5000",
            "telephone": "(626) 397-5000",
            "recipientName": "Peter Wright",
            "displayName": "Peter Wright 100 West California Boulevard Room202 Building7 Pasadena California 91105 United States Cel: (626) 397-5000 Tel: (626) 397-5000"
        },
        "processorRemark": "sample_processorRemark",
        "customerRemark": "sample_customerRemark",
        "grossProfitMargin": 10.5,
        "grossProfitAmount": 10.5,
        "productLines": [
                            {
                                "customFields": {
                                    "ext_default_UDF1": "value",
                                    "ext_default_UDF2": 12
                                },
                                "lineNumber": 1,
                                "quantity": "12.345",
                                "salesUom": {
                                    "name": "bottle"
                                },
                                "uomConversionRate": 10.5,
                                "inventoryUomQuantity": 10.5,
                                "inventoryUom": {
                                    "name": "bottle"
                                },
                                "netUnitPrice": 10.5,
                                "grossUnitPrice": 10.5,
                                "standardPrice": 10.5,
                                "variants": "sample_variants",
                                "discount": 10.5,
                                "estimatedTax": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "netAmount": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "grossAmount": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "calculationBase": "BY_DEFAULT",
                                "costingMethod": "NO_COST",
                                "grossProfitMargin": 10.5,
                                "grossProfitAmount": 10.5,
                                "estimatedUnitCost": 10.5,
                                "estimatedTotalCost": 10.5,
                                "sku": {
                                    "name": "Juice_Orange_Big",
                                    "code": "P001"
                                },
                                "warehouse": {
                                    "name": "Main warehouse",
                                    "code": "WH01"
                                },
                                "logisticsStatus": "ORDERED",
                                "invoiceStatus": "INVOICED",
                                "exception": {
                                    "description": "sample_description"
                                },
                                "isPreparingStock": false,
                                "remark": "sample_remark",
                                "detailedTaxInfo": [
                                                    {
                                                        "name": "sample_name",
                                                        "taxDocumentType": "SALES",
                                                        "country": "sample_country",
                                                        "state": "sample_state",
                                                        "city": "sample_city",
                                                        "zipCode": "sample_zipCode",
                                                        "validFor": "ALL",
                                                        "taxBusinessPartnerGroup": "LIABLE",
                                                        "taxClass": {
                                                            "description": "Standard"
                                                        },
                                                        "rateType": "RATIO",
                                                        "rateValue": 10.5,
                                                        "taxAmount": 10.5,
                                                        "inputAmount": 10.5,
                                                        "taxDefinitionId": 1,
                                                        "taxDocumentKey": 1
                                                    }
                                                ]
                            }
                        ],
        "returnLines": [
                            {
                                "customFields": {
                                    "ext_default_UDF1": "value",
                                    "ext_default_UDF2": 12
                                },
                                "lineNumber": 1,
                                "quantity": "12.345",
                                "salesUom": {
                                    "name": "bottle"
                                },
                                "uomConversionRate": 10.5,
                                "inventoryUomQuantity": 10.5,
                                "inventoryUom": {
                                    "name": "bottle"
                                },
                                "netUnitPrice": 10.5,
                                "grossUnitPrice": 10.5,
                                "discount": 10.5,
                                "estimatedTax": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "netAmount": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "grossAmount": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "calculationBase": "BY_DEFAULT",
                                "costingMethod": "NO_COST",
                                "grossProfitMargin": 10.5,
                                "grossProfitAmount": 10.5,
                                "estimatedUnitCost": 10.5,
                                "estimatedTotalCost": 10.5,
                                "baseDocument": {
                                    "baseId": 1,
                                    "baseNumber": "sample_baseNumber",
                                    "baseType": "sample_baseType",
                                    "baseLineId": 1,
                                    "baseLineNumber": 1
                                },
                                "sku": {
                                    "name": "Juice_Orange_Big",
                                    "code": "P001"
                                },
                                "warehouse": {
                                    "name": "Main warehouse",
                                    "code": "WH01"
                                },
                                "logisticsStatus": "ORDERED",
                                "invoiceStatus": "INVOICED",
                                "exception": {
                                    "description": "sample_description"
                                },
                                "remark": "sample_remark",
                                "detailedTaxInfo": [
                                                    {
                                                        "name": "sample_name",
                                                        "taxDocumentType": "SALES",
                                                        "country": "sample_country",
                                                        "state": "sample_state",
                                                        "city": "sample_city",
                                                        "zipCode": "sample_zipCode",
                                                        "validFor": "ALL",
                                                        "taxBusinessPartnerGroup": "LIABLE",
                                                        "taxClass": {
                                                            "description": "Standard"
                                                        },
                                                        "rateType": "RATIO",
                                                        "rateValue": 10.5,
                                                        "taxAmount": 10.5,
                                                        "inputAmount": 10.5,
                                                        "taxDefinitionId": 1,
                                                        "taxDocumentKey": 1
                                                    }
                                                ],
                                "isPreparingStock": false
                            }
                        ],
        "shippingLines": [
                            {
                                "customFields": {
                                    "ext_default_UDF1": "value",
                                    "ext_default_UDF2": 12
                                },
                                "lineNumber": 1,
                                "netAmount": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "grossAmount": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "estimatedTax": {
                                    "amount": 10.5,
                                    "amountLocalCurrency": 10.5
                                },
                                "remark": "sample_remark",
                                "detailedTaxInfo": [
                                                    {
                                                        "name": "sample_name",
                                                        "taxDocumentType": "SALES",
                                                        "country": "sample_country",
                                                        "state": "sample_state",
                                                        "city": "sample_city",
                                                        "zipCode": "sample_zipCode",
                                                        "validFor": "ALL",
                                                        "taxBusinessPartnerGroup": "LIABLE",
                                                        "taxClass": {
                                                            "description": "Standard"
                                                        },
                                                        "rateType": "RATIO",
                                                        "rateValue": 10.5,
                                                        "taxAmount": 10.5,
                                                        "inputAmount": 10.5,
                                                        "taxDefinitionId": 1,
                                                        "taxDocumentKey": 1
                                                    }
                                                ]
                            }
                        ],
        "detailedTaxInfo": [
                            {
                                "name": "sample_name",
                                "taxDocumentType": "SALES",
                                "country": "sample_country",
                                "state": "sample_state",
                                "city": "sample_city",
                                "zipCode": "sample_zipCode",
                                "validFor": "ALL",
                                "taxBusinessPartnerGroup": "LIABLE",
                                "taxClass": {
                                    "description": "Standard"
                                },
                                "rateType": "RATIO",
                                "rateValue": 10.5,
                                "taxAmount": 10.5,
                                "inputAmount": 10.5,
                                "taxDefinitionId": 1,
                                "taxDocumentKey": 1
                            }
                        ],
        "creationTime": "2015-09-22T06:10:00.000Z",
        "updateTime": "2015-09-22T06:10:00.000Z",
        "returnReason": "sample_returnReason",
        "paymentTerm": {
            "name": "sample_name"
        },
        "headerCalculationBase": "BY_DEFAULT"
    }
  end
end