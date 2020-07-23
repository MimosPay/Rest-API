# I18n.t('charge.title') {#charges}

## I18n.t('charge.create_a_charge') {#create-a-charge}

I18n.t('charge.create_a_charge_note')

<aside class="notice">
I18n.t(:auth_required_key)
</aside>

> Code samples

```shell
# You can also use wget
curl -X POST https://api.mimos.io/crypto-checkout/v1/charges \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'X-MM-APP-ID: 6e1dd7ce21874898b0b77b3288f006fa' \
  -H 'X-MM-TIMESTAMP: 1594643572157' \
  -H 'X-MM-SIGNATURE: B0499D4EDF0D82A6B18C192311C0C97C' \
  -H 'X-MM-NONCE: ttmx9loxhtl'
  --data-binary '{"external_order_id":"yz7ls58srfih1zmr4dw6y","name":"iphone 11","price":"599","currency":"USD","metadata":"{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}"}'
```

```javascript--node
const fetch = require('node-fetch');
const inputBody = {
  "metadata": "{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}",
  "price": "599",
  "name": "iphone 11",
  "external_order_id": "yz7ls58srfih1zmr4dw6y",
  "currency": "USD"
};
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'X-MM-APP-ID':'6e1dd7ce21874898b0b77b3288f006fa',
  'X-MM-TIMESTAMP':'1594643572157',
  'X-MM-SIGNATURE':'B0499D4EDF0D82A6B18C192311C0C97C',
  'X-MM-NONCE':'ttmx9loxhtl'
};

fetch('https://api.mimos.io/crypto-checkout/v1/charges',
{
  method: 'POST',
  body: JSON.stringify(inputBody),
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Content-Type": []string{"application/json"},
        "Accept": []string{"application/json"},
        "X-MM-APP-ID": []string{"6e1dd7ce21874898b0b77b3288f006fa"},
        "X-MM-TIMESTAMP": []string{"1594643572157"},
        "X-MM-SIGNATURE": []string{"B0499D4EDF0D82A6B18C192311C0C97C"},
        "X-MM-NONCE": []string{"ttmx9loxhtl"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("POST", "https://api.mimos.io/crypto-checkout/v1/charges", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

```python
import json
import requests
import hashlib

appId = '9b0798f2971148ba9828820612ae34bb'
appKey = 'gPGZwIu7r5bVP6B8q0HDrEtpM8VOqkTEjXkdfh4lGjYUum7h5ohYoJEfcmaxVork'
timestamp = 1595497196656

headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'X-MM-APP-ID': appId,
  'X-MM-TIMESTAMP': "{}".format(timestamp),
  'X-MM-SIGNATURE': 'B0499D4EDF0D82A6B18C192311C0C97C',
  'X-MM-NONCE': 'ttmx9loxhtl'
}

payload = {
  "metadata": "{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}",
  "price": "599",
  "name": "iphone 11",
  "external_order_id": "order-ad-{}".format(timestamp),
  "currency": "USD"
}

total = {'X-MM-APP-ID': headers['X-MM-APP-ID'], 'X-MM-NONCE': headers['X-MM-NONCE'],
         'X-MM-TIMESTAMP': headers['X-MM-TIMESTAMP']}

# add payload TotalPrapameter
for k in list(payload.keys()):
   total[k]=payload[k]

t_keys = list(total.keys())
t_keys.sort()

stringA = ""
for k in t_keys :
  stringA+= "{}={}&".format(k, total[k])

stringA+= "key={}".format(appKey)

m = hashlib.md5()
m.update(stringA.encode("utf-8"))
h = m.hexdigest().upper()

headers['X-MM-SIGNATURE'] = h

r = requests.post('https://api.dev.mimos.io/crypto-checkout/v1/charges', data = json.dumps(payload), headers = headers)

print(r.json())

```

### I18n.t(:http_request) {#create-a-charge-request}

`POST /v1/charges`

> Body parameter

```json
{
  "external_order_id":"yz7ls58srfih1zmr4dw6y",
  "name":"iphone 11",
  "price":"599",
  "currency":"USD",
  "metadata":"{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}"
}
```

#### I18n.t(:http_request_headers) {#create-a-charge-request-headers}

|Name|Type|Required|Description|
|---|---|---|---|
|X-MM-APP-ID|string|true|[I18n.t(:your_api_key)][mimos-pay-settings]|
|X-MM-TIMESTAMP|number|true|I18n.t('field.utc_time_in_millis'), I18n.t('field.data_valid_in_5_min')|
|X-MM-NONCE|string|true|I18n.t('field.nonce')|
|X-MM-SIGNATURE|string|true|I18n.t('field.signature')|

#### I18n.t(:http_request_body) {#create-a-charge-request-body}

|Name|Type|Required|Description|
|---|---|---|---|
|external_order_id|string|true|I18n.t('field.external_order_id')|
|name|string|true|I18n.t('field.sku_name')|
|price|number|true|I18n.t('field.sku_local_price')|
|currency|string|true|I18n.t('field.sku_local_currency')[I18n.t('field.supported_fiat_currencies')](#fiat-currencies)|
|metadata|string|false|I18n.t('field.metadata')<br/>I18n.t('field.metadata_note')<ul><li>image_url: I18n.t('field.metadata_url')</ul></li>|

### I18n.t(:http_response) {#create-a-charge-response}

> Response Examples,

```json
{
  "status":"201",
  "code":"0",
  "message":"created",
  "data":{
    "merchant_id":"117510825734795264",
    "order_id":"37877858784210944",
    "order_identifier":"3v9YNZzCpG41vgMGZtRLPD",
    "external_order_id":"yz7ls58srfih1zmr4dw6y",
    "name":"iphone 11",
    "amount":"599",
    "currency":"USD",
    "type":"FIXED_VALUE",
    "created_at":"1594643585263",
    "expired_at":"1594644485263",
    "state":"PRE_ORDER",
    "sub_state":"NONE",
    "charge_pricing":{
      "ethereum":{
        "amount":"2.460093",
        "currency":"ETH"
      }
    },
    "metadata":"{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}",
    "charge_url":"https://w.mimos.io/crypto-checkout/3v9YNZzCpG41vgMGZtRLPD",
    "required_info":{
      "bill_address":true,
      "customer_name":false
    },
    "recipient_name":"test-new-api"
  }
}
```

```json
# Invalid X-MM-TIMESTAMP
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

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[ApiResponse](#schema-apiresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|[ApiResponse](#schema-apiresponse)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schema-apiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schema-apiresponse)|

## I18n.t('charge.upadte_a_charge') {#update-a-charge}

I18n.t('charge.upadte_a_charge_note1')

I18n.t('charge.upadte_a_charge_note2')

I18n.t('charge.upadte_a_charge_note3')

<aside class="success">
I18n.t(:no_auth_required)
</aside>

> Code samples

```shell
# You can also use wget
curl -X PUT https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'
  --data-binary '{"payment_method":"ethereum","bill_address":"test@test.io"}'
```

```javascript--node
const fetch = require('node-fetch');
const inputBody = {
  "bill_address":"test@test.io",
  "payment_method":"ethereum"
};
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'
};

fetch('https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier}',
{
  method: 'PUT',
  body: JSON.stringify(inputBody),
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Content-Type": []string{"application/json"},
        "Accept": []string{"application/json"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("PUT", "https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier}", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

payload = {
  "bill_address":"test@test.io",
  "payment_method":"ethereum"
}
r = requests.put('https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier}', data = payload, headers = headers)

print(r.json())

```

### I18n.t(:http_request) {#update-a-charge-request}

`PUT /v1/charges/{order_identifier}`

#### Request Path {#update-a-charge-request-path}

`order_identifier`: I18n.t('field.order_identifier')

#### I18n.t(:http_request_params) {#update-a-charge-request-params}

> Body parameter

```json
{
  "payment_method":"ethereum",
  "bill_address":"test@test.io"
}
```

#### I18n.t(:http_request_body) {#update-a-charge-request-body}

|Name|Type|Required|Description|
|---|---|---|---|
|payment_method|string|true|I18n.t('field.payment_method_list_in')[I18n.t('field.supported_crypto_currencies')](##crypto-currencies):<ul><li>ethereum</li><li>bitcoin</li><li>tether</li></ul>|
|bill_address|string|false|I18n.t('field.bill_address')|
|customer_name|string|false|I18n.t('field.customer_name')|

### I18n.t(:http_response) {#update-a-charge-response}

> Response Examples,

```json
{
  "status":"200",
  "code":"0",
  "message":"success",
  "data":{
    "merchant_id":"117510825734795264",
    "order_id":"37877858784210944",
    "order_identifier":"3v9YNZzCpG41vgMGZtRLPD",
    "external_order_id":"yz7ls58srfih1zmr4dw6y",
    "name":"iphone 11",
    "amount":"599",
    "remain_amount":"599",
    "currency":"USD",
    "payment_method":"ethereum",
    "type":"FIXED_VALUE",
    "created_at":"1594643932916",
    "expired_at":"1594644232916",
    "state":"NEW",
    "sub_state":"NONE",
    "addresses":{
      "ethereum":"0xd5f7fEE1f0E0dCecccc80a847fE57e9DEcDDad88"
    },
    "charge_pricing":{
      "ethereum":{
        "amount":"2.460692",
        "currency":"ETH"
      }
    },
    "metadata":"{\"image_url\": \"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\", \"customer_id\": \"123456\", \"customer_name\": \"my-user-name\"}",
    "charge_url":"https://w.mimos.io/crypto-checkout/3v9YNZzCpG41vgMGZtRLPD",
    "required_info":{
      "bill_address":true,
      "customer_name":false
    },
    "bill_address":"test@test.io",
    "recipient_name":"test-new-api",
    "crypto_amount":"2.460692",
    "crypto_currency":"ETH"
  }
}
```

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApiResponse](#schema-apiresponse)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schema-apiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schema-apiresponse)|

## I18n.t('charge.show_a_charge') {#show-a-charge}

<aside class="success">
I18n.t(:no_auth_required)
</aside>

I18n.t('charge.show_a_charge_note')

> Code samples

```shell
# You can also use wget
curl -X GET https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier} \
  -H 'Accept: application/json'
```

```javascript--node
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json'
};

fetch('https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Accept": []string{"application/json"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("GET", "https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier}", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('https://api.mimos.io/crypto-checkout/v1/charges/{order_identifier}', headers = headers)

print(r.json())

```

### I18n.t(:http_request) {#show-a-charge-request}

`GET /v1/charges/{order_identifier}`

#### Request Path {#show-a-charge-request-path}

`order_identifier`: I18n.t('field.order_identifier')

#### I18n.t(:http_request_params) {#show-a-charge-request-params}

|Name|Type|Required|Description|
|---|---|---|---|
|show_details|boolean|false|I18n.t('field.show_details')|

> Example responses

> 200 Response, show_details = false

```json
```

> 200 Response, show_details = true

```json
{
  "status":"200",
  "code":"0",
  "message":"success",
  "data":{
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
    "charge_url":"https://w.mimos.io/crypto-checkout/3v9YNZzCpG41vgz5kCjwyK",
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
}
```

### I18n.t(:http_response) {#show-a-charge-response}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApiResponse](#schema-apiresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|[ApiResponse](#schema-apiresponse)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schema-apiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schema-apiresponse)|

[mimos-pay-settings]: https://w.mimos.io/commerce/en/settings
[supported_fiat_currencies]: #fiat-currencies
