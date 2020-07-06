# Charges

## Create a charge

> Code samples

```shell
# You can also use wget
curl -X POST https://api.mimos.io/crypto-checkout/v1/charges \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'X-MM-APP-ID: string' \
  -H 'X-MM-TIMESTAMP: 0' \
  -H 'X-MM-SIGNATURE: string' \
  -H 'X-MM-NONCE: string'

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
        "X-MM-APP-ID": []string{"string"},
        "X-MM-TIMESTAMP": []string{"0"},
        "X-MM-SIGNATURE": []string{"string"},
        "X-MM-NONCE": []string{"string"},
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
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'X-MM-APP-ID': 'string',
  'X-MM-TIMESTAMP': '0',
  'X-MM-SIGNATURE': 'string',
  'X-MM-NONCE': 'string'
}

r = requests.post('https://api.mimos.io/crypto-checkout/v1/charges', headers = headers)

print(r.json())

```
### HTTP Request

`POST /v1/charges`

#### Request Parameters

> Body parameter

```json
{
  "metadata": "string",
  "price": 0,
  "name": "string",
  "external_order_id": "string",
  "currency": "string",
  "type": "string"
}
```

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|X-MM-APP-ID|header|string|true|none|
|X-MM-TIMESTAMP|header|integer(int64)|true|none|
|X-MM-SIGNATURE|header|string|true|none|
|X-MM-NONCE|header|string|true|none|
|body|body|[ChargeCreateDto](#schemachargecreatedto)|true|none|
|» metadata|body|string|false|none|
|» price|body|number|true|none|
|» name|body|string|true|none|
|» external_order_id|body|string|true|none|
|» currency|body|string|true|none|
|» type|body|string|false|none|

### HTTP Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[ApiResponseChargeOrderDto](#schemaapiresponsechargeorderdto)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schemaapiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schemaapiresponse)|

<aside class="success">
This operation does not require authentication
</aside>

## Update a charge

> Code samples

```shell
# You can also use wget
curl -X PUT https://api.mimos.io/crypto-checkout/v1/charges/{orderIdentifier} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

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
    req, err := http.NewRequest("PUT", "https://api.mimos.io/crypto-checkout/v1/charges/{orderIdentifier}", data)
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

r = requests.put('https://api.mimos.io/crypto-checkout/v1/charges/{orderIdentifier}', headers = headers)

print(r.json())

```

### HTTP Request

`PUT /v1/charges/{orderIdentifier}`

#### Request Parameters

> Body parameter

```json
{
  "customer_name": "string",
  "bill_address": "string",
  "payment_method": "string"
}
```

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|orderIdentifier|path|string|true|none|
|body|body|[ChargePublicUpdateDto](#schemachargepublicupdatedto)|true|none|
|» customer_name|body|string|false|none|
|» bill_address|body|string|false|none|
|» payment_method|body|string|false|none|

### HTTP Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApiResponseChargeOrderDto](#schemaapiresponsechargeorderdto)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schemaapiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schemaapiresponse)|

<aside class="success">
This operation does not require authentication
</aside>

## Show a charge

> Code samples

```shell
# You can also use wget
curl -X GET https://api.mimos.io/crypto-checkout/v1/charges/{orderIdentifier} \
  -H 'Accept: application/json'

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
    req, err := http.NewRequest("GET", "https://api.mimos.io/crypto-checkout/v1/charges/{orderIdentifier}", data)
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

r = requests.get('https://api.mimos.io/crypto-checkout/v1/charges/{orderIdentifier}', headers = headers)

print(r.json())

### HTTP Request

`GET /v1/charges/{orderIdentifier}`

#### Request Parameters

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|orderIdentifier|path|string|true|none|
|showDetails|query|boolean|false|none|

> Example responses

> 200 Response

```json
{
  "code": 0,
  "data": {
    "charge_pricing": {
      "property1": {
        "amount": 0,
        "last_update": 0,
        "currency": "string"
      },
      "property2": {
        "amount": 0,
        "last_update": 0,
        "currency": "string"
      }
    },
    "addresses": {
      "property1": "string",
      "property2": "string"
    },
    "metadata": "string",
    "crypto_amount": 0,
    "payments": [
      {
        "base_currency": "string",
        "amount": 0,
        "tx_hash": "string",
        "network": "string",
        "detected_at": 0,
        "base_amount": 0,
        "currency": "string",
        "block": {
          "network_id": 0,
          "tx_count": 0,
          "accumulated_confirmed": 0,
          "best_height": 0,
          "prev_hash": "string",
          "required_confirmed": 0,
          "best_hash": "string",
          "time": 0,
          "next_hash": "string",
          "hash": "string",
          "forked": true,
          "height": 0
        },
        "state": "string",
        "tx_index": 0,
        "state_code": 0,
        "confirmed_at": 0,
        "from_address": "string"
      }
    ],
    "created_at": 0,
    "merchant_id": 0,
    "expired_at": 0,
    "type": "string",
    "refunds": [
      {
        "detected_at": 0,
        "amount": 0,
        "fee": 0,
        "to_address": "string",
        "currency": "string",
        "tx_hash": "string",
        "block": {
          "network_id": 0,
          "tx_count": 0,
          "accumulated_confirmed": 0,
          "best_height": 0,
          "prev_hash": "string",
          "required_confirmed": 0,
          "best_hash": "string",
          "time": 0,
          "next_hash": "string",
          "hash": "string",
          "forked": true,
          "height": 0
        },
        "state": "string",
        "state_code": 0,
        "confirmed_at": 0,
        "tx_index": 0,
        "network": "string"
      }
    ],
    "checkout_id": "string",
    "currency": "string",
    "state": "string",
    "payment_method": "string",
    "crypto_currency": "string",
    "amount": 0,
    "sub_state": "string",
    "unresolved_id": 0,
    "remain_amount": 0,
    "bill_address": "string",
    "charge_url": "string",
    "order_identifier": "string",
    "sub_state_code": 0,
    "paid_base_amount": 0,
    "name": "string",
    "paid_amount": 0,
    "external_order_id": "string",
    "customer_name": "string",
    "state_code": 0,
    "recipient_name": "string",
    "order_id": 0,
    "cancel_url": "string",
    "redirect_url": "string",
    "required_info": {
      "customer_name": true,
      "bill_address": true,
      "payment_method": true
    }
  },
  "message": "string",
  "error": {},
  "status": 0
}
```

### HTTP Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApiResponseChargeOrderDto](#schemaapiresponsechargeorderdto)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schemaapiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schemaapiresponse)|

<aside class="success">
This operation does not require authentication
</aside>

