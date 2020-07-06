# Resources

## Common Response

> Example,

```json
{
  "code": 0,
  "data": {},
  "message": "string",
  "error": {},
  "status": 0
}

```

|Name|Type|Description|
|---|---|---|
|code|integer(int32)|none|
|data|object|none|
|message|string|none|
|error|object|none|
|status|integer(int32)|none|


## Charge<a name="schema_charge_order"></a>

> Example,

```json
{
  "status":"200",
  "code":"0",
  "message":"success",
  "data":{
    "merchant_id":"117510825734795264",
    "order_id":"34177479978479616",
    "order_identifier":"3v9YNZzCpG4arZrHsJbCpc",
    "external_order_id":"ueyjedsz95x4v4l51k4d",
    "name":"HuaWei P40",
    "amount":"3",
    "currency":"CNY",
    "payment_method":"ethereum",
    "type":"FIXED_VALUE",
    "created_at":"1593761382740",
    "expired_at":"1593761682740",
    "state":"COMPLETE",
    "sub_state":"OVERPAID",
    "state_code":"3",
    "sub_state_code":"2",
    "addresses":{
      "ethereum":"0x500B66C6FF6c0917020D0bE6F1f9482cF535C8ae"
    },
    "payments":[
      {
        "network":"ethereum",
        "tx_hash":"0x9978bc4c44a9a14151d9cfeed557ab51feb6548b2c8f101b44a67a92091f1df7",
        "tx_index":"1",
        "from_address":"TODO",
        "amount":"0.001876",
        "currency":"ETH",
        "base_amount":"3.01",
        "state":"COMPLETE",
        "state_code":"1",
        "detected_at":"1593761577651",
        "confirmed_at":"1593761641110",
        "block":{
          "network_id":"5",
          "height":"2980446",
          "hash":"0xdfca138018a58ef29606084d59ec3d1b48221c71b2c52ae7904617a7c3a77b0b",
          "tx_count":"0",
          "time":"1593761577651",
          "required_confirmed":"6",
          "accumulated_confirmed":"6",
          "forked":false,
          "best_height":"0"
        }
      }
    ],
    "metadata":"{\"image_url\": \"http://your.image.jpg\"}",
    "charge_url":"https://w.mimos.io/crypto-checkout/3v9YNZzCpG4arZrHsJbCpc",
    "required_info":{
      "bill_address":true,
      "customer_name":false
    },
    "bill_address":"test@test.com",
    "recipient_name":"test",
    "unresolved_id":"34178719055572992",
    "crypto_amount":"0.001872",
    "crypto_currency":"ETH"
  }
}
```

|Name|Type|Description|
|---|---|---|---|---|
|charge_pricing|map<string, object>|none|
|» **additionalProperties**|[Charge Prices](#schema_charge_order_price)|none|
|addresses|object|none|
|» **additionalProperties**|map<string, string>|none|
|metadata|string|none|
|crypto_amount|number|none|
|payments|[Charge Payments[](#schema_charge_order_payment)]|none|
|created_at|integer(int64)|none|
|merchant_id|integer(int64)|none|
|expired_at|integer(int64)|none|
|type|string|none|
|refunds|[Charge Refunds[](#schema_charge_order_refund)]|none|
|checkout_id|string|none|
|currency|string|none|
|state|string|none|
|payment_method|string|none|
|crypto_currency|string|none|
|amount|number|none|
|sub_state|string|none|
|unresolved_id|integer(int64)|none|
|remain_amount|number|none|
|bill_address|string|none|
|charge_url|string|none|
|order_identifier|string|none|
|sub_state_code|integer(int32)|none|
|paid_base_amount|number|none|
|name|string|none|
|paid_amount|number|none|
|external_order_id|string|none|
|customer_name|string|none|
|state_code|integer(int32)|none|
|recipient_name|string|none|
|order_id|integer(int64)|none|
|cancel_url|string|none|
|redirect_url|string|none|
|required_info|[Charge Rquried](#schema_charge_order_required)|none|

### Charge Price<a name="schema_charge_order_price"></a>

> Example,

```json
{
  "amount": "12.232",
  "last_update": "0",
  "currency": "ETH"
}

```

|Name|Type|Description|
|---|---|---|---|---|
|amount|number|none|
|last_update|integer(int64)|none|
|currency|string|none|


### Charge Payments<a name="schema_charge_order_payment"></a>


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
  "state_code":"1",
  "detected_at":"1593761577651",
  "confirmed_at":"1593761641110",
  "block":{
    "network_id":"5",
    "height":"2980446",
    "hash":"0xdfca138018a58ef29606084d59ec3d1b48221c71b2c52ae7904617a7c3a77b0b",
    "tx_count":"0",
    "time":"1593761577651",
    "required_confirmed":"6",
    "accumulated_confirmed":"6",
    "forked":false,
    "best_height":"0"
  }
}

```

|Name|Type|Description|
|---|---|---|---|---|
|base_currency|string|none|
|amount|number|none|
|tx_hash|string|none|
|network|string|none|
|detected_at|integer(int64)|none|
|base_amount|number|none|
|currency|string|none|
|block|[Block Tx](#schema_charge_order_tx_block)|none|
|state|string|none|
|tx_index|integer(int32)|none|
|state_code|integer(int32)|none|
|confirmed_at|integer(int64)|none|
|from_address|string|none|

### Charge Refund<a name="schema_charge_order_refund"></a>

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
    "tx_count":"0",
    "time":"1594043557252",
    "required_confirmed":"6",
    "accumulated_confirmed":"1",
    "forked":false,
    "best_height":"0"
  }
}
```

|Name|Type|Description|
|---|---|---|---|---|
|detected_at|integer(int64)|none|
|amount|number|none|
|fee|number|none|
|to_address|string|none|
|currency|string|none|
|tx_hash|string|none|
|block|[Block Tx](#schema_charge_order_tx_block)|none|
|state|string|none|
|state_code|integer(int32)|none|
|confirmed_at|integer(int64)|none|
|tx_index|integer(int32)|none|
|network|string|none|

### Charge Required Infomations<a name="schema_charge_order_required"></a>

> Example,

```json
{
  "customer_name": true,
  "bill_address": true,
  "payment_method": true
}

```

|Name|Type|Description|
|---|---|---|---|---|
|customer_name|string|none|
|bill_address|string|none|
|payment_method|string|none|


## Block Tx Information<a name="schema_charge_order_tx_block"></a>

> Example,

```json
{
  "network_id":"5",
  "height":"2843414",
  "hash":"0xdc9df24a26af920ebdb9a15e8c93c504247e9a055620a4d083858f7e91120a9a",
  "tx_count":"0",
  "time":"1591704974541",
  "required_confirmed":"6",
  "accumulated_confirmed":"6",
  "forked":false,
  "best_height":"0"
}
```

|Name|Type|Description|
|---|---|---|---|---|
|network_id|integer(int64)|none|
|tx_count|integer(int32)|none|
|accumulated_confirmed|integer(int32)|none|
|best_height|integer(int64)|none|
|prev_hash|string|none|
|required_confirmed|integer(int32)|none|
|best_hash|string|none|
|time|integer(int64)|none|
|next_hash|string|none|
|hash|string|none|
|forked|boolean|none|
|height|integer(int64)|none|

