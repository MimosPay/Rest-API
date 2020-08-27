# I18n.t('resource.title') {#schema-resources}

<aside class="notice">
I18n.t('resource.number_note1')<br/><br/>
I18n.t('resource.number_note2')
<ul>
  <li>I18n.t('resource.number_note2_rule1')</li>
  <li>I18n.t('resource.number_note2_rule2')-(2<sup>53</sup> -1) ~ (2<sup>53</sup> - 1)</li>
</ul>
</aside>

## ApiResponse {#schema-apiresponse}

> Example,

```json
{
  "status":"200",
  "code":"0",
  "message":"success",
  "data":{
    "order_identifier":"3v9YNZzCpG41vgz5kCjwyK",
    "external_order_id":"c3yo4kmimhw0v8924ch36m9",
    "name":"iphone 11",
    "amount":"99",
    "remain_amount":"0.01",
    ...
  }
}
```

```json
{
  "status":"400",
  "code":"22000004",
  "message":"Invalid X-MM-TIMESTAMP",
  "error":{
    "module":"22",
    "module_name":"CHECKOUT_API",
    "code":"22000004",
    "message":"Invalid X-MM-TIMESTAMP",
    "key":"biz.invalid.request.timestamp"
  }
}
```

|Name|Type|Description|
|---|---|---|
|status|number|HTTP status code|
|code|number|<ul><li>0 - success</li><li>Not zero number - error codes</li></ul>|
|message|string|success or error message|
|data|object|the object defined in [resources](#schema-resources) when response `2xx`|
|error|object|the error object when response `4xx` or `5xx`|

## Charge {#schema-charge-order}

> Example,

```json
{
  "merchant_id":"117510825734795264",
  "order_id":"37870665871618048",
  "order_identifier":"3v9YNZzCpG41vgz5kCjwyK",
  "external_order_id":"c3yo4kmimhw0v8924ch36m9",
  "name":"iphone 11",
  "amount":"99",
  "remain_amount":"0.01",
  "currency":"CNY",
  "payment_method":"ethereum",
  "type":"FIXED_VALUE",
  "created_at":"1594641884350",
  "expired_at":"1594642184350",
  "state":"CANCEL",
  "sub_state":"UNDERPAID",
  "addresses":{
    "ethereum":"0x0A4C37559feE8EbB30d21242E370e332564d60C1"
  },
  "charge_pricing":{
    "ethereum":{
      "amount":"0.000004",
      "currency":"ETH"
    }
  },
  "payments":[
    {
      "network":"ethereum",
      "tx_hash":"0x7932bc20a7cfe2343e7d8ca08fb613d47465725f11a109a837be16070b89ffb1",
      "tx_index":"0",
      "amount":"0.057911",
      "currency":"ETH",
      "base_amount":"98.99",
      "state":"COMPLETE",
      "detected_at":"1594642153956",
      "confirmed_at":"1594642212623",
      "block":{
        "network_id":"5",
        "height":"3039067",
        "hash":"0x37d5cd540512590692a23a2be0c7a553e328aad3a1835660fe2666a5bdab8dc0",
        "time":"1594642153956",
        "required_confirmed":"6",
        "accumulated_confirmed":"6",
        "forked":false
      }
    }
  ],
  "metadata":"{\"image_url\": \"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\", \"customer_id\": \"123456\", \"customer_name\": \"my-user-name\"}",
  "charge_url":"https://w.dev.mimos.io/crypto-checkout/3v9YNZzCpG41vgz5kCjwyK",
  "required_info":{
    "bill_address":true,
    "customer_name":false
  },
  "bill_address":"test@aerohive.com",
  "recipient_name":"test-new-api",
  "crypto_amount":"0.057915",
  "crypto_currency":"ETH",
  "refunds":[
    {
      "network":"ethereum",
      "to_address":"0x0Ad3355B3023f73a2C443Fe2C8440735d1589596",
      "amount":"0.057911",
      "currency":"ETH",
      "state":"COMPLETE",
      "detected_at":"1594642448830",
      "confirmed_at":"1594642452707",
      "tx_hash":"0xe7c24562dcefc45c11c2716d88fb1ae52d4971295454a912fb2734711b6420a4",
      "tx_index":"1",
      "block":{
        "network_id":"5",
        "height":"3039087",
        "hash":"0x400a1111fcb8f3eec6c1e222b78260b1bbce8b58df97d8257cd5c53ca41f5564",
        "time":"1594642448742",
        "required_confirmed":"6",
        "accumulated_confirmed":"6",
        "forked":false
      }
    }
  ]
}
```

|Name|Type|Description|
|---|---|---|---|---|
|merchant_id|number|The id of merchant |
|order_id|number|The id of charge order|
|checkout_id|string|The id of checkout order |
|order_identifier|string|The identifier of charge order |
|external_order_id|string|The order id of the merchant's own system|
|name|string|The product/order name|
|amount|number|Price in local fiat currency|
|remain_amount|number|The remaining price in local fiat currency|
|payment_method|string|Crypto payment methods, see [Supported Crypto Currencies](#crypto-currencies)|
|bill_address|string|The email address from customer|
|customer_name|string|The name from customer|
|currency|string|Three-letter ISO currency code, in uppercase. Must be a [supported currency](#fiat-currencies)|
|created_at|number|The UTC timestamp in millisecond of charge order creation time|
|expired_at|number|The UTC timestamp in millisecond of charge order expiration time|
|state|string|The charge state:<ul><li>PRE_ORDER</li><li>NEW</li><li>PENDING</li><li>CONFIRMING</li><li>COMPLETE</li><li>CANCEL</li></ul>|
|sub_state|string|The charge sub state:<ul><li>NONE</li><li>EXPIRED</li><li>UNDERPAID</li><li>OVERPAID</li></ul>|
|metadata|string|Metadata associated with the charge|
|charge_url|string|MimosPay Hosted charge URL|
|success_redirect_url|string|Merchant Hosted payment success redirect URL|
|failure_redirect_url|string|Merchant Hosted payment failure redirect URL|
|crypto_amount|number|Price in crypto currency|
|crypto_currency|string|The crypto currency code, in uppercase. Must be a [supported currency](#crypto-currencies)|
|type|string|The type of charge,<ul><li>FIXED_VALUE</li><li>ANY_VALUE</li></ul>|
|recipient_name|string|The name of recipient|
|unresolved_id|number|The unresolved id associated with the charge, if there exist the unresolved payment in, <ul><li>EXPIRED</li><li>UNDERPAID</li><li></li><li>OVERPAID</li></ul>|
|required_info|[Charge Rquried](#schema-charge-order-required-information)|The charge requirement information|
|addresses|map\<string, string\>|Set of addresses associated with the charge, the key is payment method|
|» **additionalProperties**|string|The associated crypto address|
|charge_pricing|map\<string, object\>|Set of price information associated with the charge, the key is payment method|
|» **additionalProperties**|[Charge Prices](#schema-charge-order-price)|The associated price in the specific payment method|
|payments|[Charge Payment\[\]](#schema-charge-order-payment)|Array of charge payment objects|
|refunds|[Charge Refund\[\]](#schema-charge-order-refund)|Array of charge refund objects|

### Charge Price {#schema-charge-order-price}

> Example,

```json
{
  "amount": "12.232",
  "currency": "ETH"
}

```

|Name|Type|Description|
|---|---|---|---|---|
|amount|number|Price in crypto currency|
|currency|string|The crypto currency code, in uppercase. Must be a [supported currency](#crypto-currencies)|

### Charge Payments {#schema-charge-order-payment}

> Example,

```json
{
  "network":"ethereum",
  "tx_hash":"0x9978bc4c44a9a14151d9cfeed557ab51feb6548b2c8f101b44a67a92091f1df7",
  "tx_index":"1",
  "from_address":"0x0ad3355b3023f73a2c443fe2c8440735d1589596",
  "amount":"0.001876",
  "currency":"ETH",
  "base_amount":"3.01",
  "state":"COMPLETE",
  "detected_at":"1593761577651",
  "confirmed_at":"1593761641110",
  "block":{
    "network_id":"5",
    "height":"2980446",
    "hash":"0xdfca138018a58ef29606084d59ec3d1b48221c71b2c52ae7904617a7c3a77b0b",
    "time":"1593761577651",
    "required_confirmed":"6",
    "accumulated_confirmed":"6",
    "forked":false,
  }
}

```

|Name|Type|Description|
|---|---|---|---|---|
|network|string|Crypto network, see [Supported Crypto Currencies](#crypto-currencies)|
|tx_hash|string|The blockchain transaction hash for the charge payment|
|tx_index|number|The blockchain transaction index for the charge payment|
|from_address|string|The address of customer which sent the crypto currency|
|amount|number|The amount of crypto currency sent to the requested address|
|currency|string|Crypto currency, see [Supported Crypto Currencies](#crypto-currencies)|
|base_amount|number|The amount in fiat currency by currency conversion|
|base_currency|string|Fiat currency, see [Supported Fiat Currencies](#fiat-currencies)|
|state|string|The payment state:<ul><li>PENDING</li><li>FORKED</li><li>COMPLETE</li></ul>|
|detected_at|number|The UTC timestamp in millisecond of payment detection time|
|confirmed_at|number|The UTC timestamp in millisecond of payment confirmation time|
|block|[Block Tx](#schema-block-tx)|none|

### Charge Refund {#schema-charge-order-refund}

> Exmaple,

```json
{
  "network":"ethereum",
  "to_address":"0x0Ad3355B3023f73a2C443Fe2C8440735d1589596",
  "amount":"0.005866",
  "currency":"ETH",
  "state":"PENDING",
  "state_code":"1",
  "detected_at":"1594043557364",
  "confirmed_at":"0",
  "tx_hash":"0x6930b6d590c1468c479bd30dc3bfa1c7170cbc1834c2cfd47ac57ad7aaf82cf1",
  "tx_index":"1",
  "block":{
    "network_id":"5",
    "height":"2999165",
    "hash":"0xc057e1d2fa53b8ff64c272bbd4057bd5778d8b43a4e367839caaded051ddadae",
    "time":"1594043557252",
    "required_confirmed":"6",
    "accumulated_confirmed":"1",
    "forked":false
  }
}
```

|Name|Type|Description|
|---|---|---|---|---|
|network|string|Crypto network, see [Supported Crypto Currencies](#crypto-currencies)|
|tx_hash|string|The blockchain transaction hash for the charge payment|
|tx_index|number|The blockchain transaction index for the charge payment|
|to_address|string|The address of customer which receive the crypto currency|
|amount|number|The amount of crypto currency sent to the requested address|
|currency|string|Crypto currency, see [Supported Crypto Currencies](#crypto-currencies)|
|state|string|The payment state:<ul><li>NEW</li><li>PENDING</li><li>COMPLETE</li><li>CANCEL</li></ul>|
|detected_at|number|The UTC timestamp in millisecond of payment detection time|
|confirmed_at|number|The UTC timestamp in millisecond of payment confirmation time|
|fee|number|none|
|block|[Block Tx](#schema-block-tx)|none|

### Charge Required Informations {#schema-charge-order-required-information}

> Example,

```json
{
  "payment_method":"ethereum",
  "bill_address":"test@test.io",
  "customer_name": "a_customer"
}
```

|Name|Type|Description|
|---|---|---|---|---|
|payment_method|string|Payment method which is listed in [Supported Crypto Currencies](##crypto-currencies):<ul><li>ethereum</li><li>bitcoin</li><li>tether</li></ul>|
|bill_address|string|Customer email address to receive payment or refund notifications|
|customer_name|string|Customer name for email content|

## Block Tx Information {#schema-block-tx}

> Example,

```json
{
  "network_id":"5",
  "height":"2999165",
  "hash":"0xc057e1d2fa53b8ff64c272bbd4057bd5778d8b43a4e367839caaded051ddadae",
  "time":"1594043557252",
  "required_confirmed":"6",
  "accumulated_confirmed":"1",
  "forked":false
}
```

|Name|Type|Description|
|---|---|---|---|---|
|network_id|number|The id of network|
|height|number|The block height associated with the blockchain transaction|
|hash|string|The block hash associated with the blockchain transaction|
|time|number|The time at the block is mined|
|required_confirmed|number|The number of requried blockchain confirmations|
|accumulated_confirmed|number|The number of accumulated blockchain confirmations, it will stop giving updates on associated order is terminated|
|forked|boolean|The blockchain has a soft fork occurs or not on this block height|

## Event {#schema-event}

> Example,

```json
{
  "id": "tpxXfXTxY7",
  "type": "charge:new",
  "create_at": "2020-07-01T01:23:04.632Z",
  "data": {
    ...
  }
}

```

|Name|Type|Description|
|---|---|---|
|id|string|Delivery event id|
|type|string|Delivery event type,<br/><ul><li>charge:new</li><li>charge:pending</li><li>charge:confirming</li><li>charge:complete</li><li>charge:cancel</li></ul>|
|create_at|string|The UTC timestamp, e.g., 2020-07-01T01:23:04.632Z|
|data|object|Event payload,<br/><ul><li>[charge](#schema-charge-order)</li></ul>The resouce of the associated object (e.g. `charge`)|

The events types,

|Event|Description|
|---|---|
|`charge:new`|A charge is created|
|`charge:pending`|The Charge has been first detected on blockchain but has not been confrimed yet|
|`charge:confirming`|The charge has been detected and the payment amount is equal or greater than order price but has not been confrimed yet|
|`charge:complete`|The charge has be confirmed to completed|
|`charge:cancel`|The charge failed to complete, for:<ul><li>Payment expired</li><li>Payment underpaid</li></ul>|
