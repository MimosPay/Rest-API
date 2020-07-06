---
title: Mimos Commerce API v1.0.0
language_tabs:
  - shell: cURL
  - go: go
  - python: Python
language_clients:
  - shell: ""
  - go: ""
  - python: ""
toc_footers: []
includes: []
search: true
highlight_theme: darkula
headingLevel: 2

---

<!-- Generator: Widdershins v4.0.1 -->

<h1 id="mimos-commerce-api">Mimos Commerce API v1.0.0</h1>

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

The Mimos Commerce API provides a simple and powerful REST API to integrate crypto-currency payments into your business or application. This API reference provides information on available endpoints and how to interact with them.

Base URLs:

* <a href="http://localhost:8081/crypto-checkout">http://localhost:8081/crypto-checkout</a>

<a href="https://w.mimos.io/commerce/legal/terms-of-service">Terms of service</a>

License: <a href="https://mimos.io/">Commercial Use License</a>

<h1 id="mimos-commerce-api-merchant-charge-controller">merchant-charge-controller</h1>

## getCheckout

<a id="opIdgetCheckout"></a>

> Code samples

```shell
# You can also use wget
curl -X GET http://localhost:8081/crypto-checkout/v1/charges/{orderIdentifier} \
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
    req, err := http.NewRequest("GET", "http://localhost:8081/crypto-checkout/v1/charges/{orderIdentifier}", data)
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

r = requests.get('http://localhost:8081/crypto-checkout/v1/charges/{orderIdentifier}', headers = headers)

print(r.json())

```

`GET /v1/charges/{orderIdentifier}`

<h3 id="getcheckout-parameters">Parameters</h3>

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

<h3 id="getcheckout-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApiResponseChargeOrderDto](#schemaapiresponsechargeorderdto)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schemaapiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schemaapiresponse)|

<aside class="success">
This operation does not require authentication
</aside>

## completeCheckoutInformation

<a id="opIdcompleteCheckoutInformation"></a>

> Code samples

```shell
# You can also use wget
curl -X PUT http://localhost:8081/crypto-checkout/v1/charges/{orderIdentifier} \
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
    req, err := http.NewRequest("PUT", "http://localhost:8081/crypto-checkout/v1/charges/{orderIdentifier}", data)
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

r = requests.put('http://localhost:8081/crypto-checkout/v1/charges/{orderIdentifier}', headers = headers)

print(r.json())

```

`PUT /v1/charges/{orderIdentifier}`

> Body parameter

```json
{
  "customer_name": "string",
  "bill_address": "string",
  "payment_method": "string"
}
```

<h3 id="completecheckoutinformation-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|orderIdentifier|path|string|true|none|
|body|body|[ChargePublicUpdateDto](#schemachargepublicupdatedto)|true|none|
|» customer_name|body|string|false|none|
|» bill_address|body|string|false|none|
|» payment_method|body|string|false|none|

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

<h3 id="completecheckoutinformation-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApiResponseChargeOrderDto](#schemaapiresponsechargeorderdto)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schemaapiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schemaapiresponse)|

<aside class="success">
This operation does not require authentication
</aside>

## createOrder

<a id="opIdcreateOrder"></a>

> Code samples

```shell
# You can also use wget
curl -X POST http://localhost:8081/crypto-checkout/v1/charges \
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
    req, err := http.NewRequest("POST", "http://localhost:8081/crypto-checkout/v1/charges", data)
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

r = requests.post('http://localhost:8081/crypto-checkout/v1/charges', headers = headers)

print(r.json())

```

`POST /v1/charges`

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

<h3 id="createorder-parameters">Parameters</h3>

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

> Example responses

> 201 Response

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

<h3 id="createorder-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[ApiResponseChargeOrderDto](#schemaapiresponsechargeorderdto)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|[ApiResponse](#schemaapiresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|[ApiResponse](#schemaapiresponse)|

<aside class="success">
This operation does not require authentication
</aside>

# Schemas

<h2 id="tocS_ChargeOrderDto">ChargeOrderDto</h2>
<!-- backwards compatibility -->
<a id="schemachargeorderdto"></a>
<a id="schema_ChargeOrderDto"></a>
<a id="tocSchargeorderdto"></a>
<a id="tocschargeorderdto"></a>

```json
{
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
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|charge_pricing|object|false|none|none|
|» **additionalProperties**|[ChargeOrderPrice](#schemachargeorderprice)|false|none|none|
|addresses|object|false|none|none|
|» **additionalProperties**|string|false|none|none|
|metadata|string|false|none|none|
|crypto_amount|number|false|none|none|
|payments|[[ChargeOrderPayment](#schemachargeorderpayment)]|false|none|none|
|created_at|integer(int64)|false|none|none|
|merchant_id|integer(int64)|false|none|none|
|expired_at|integer(int64)|false|none|none|
|type|string|false|none|none|
|refunds|[[ChargeOrderRefund](#schemachargeorderrefund)]|false|none|none|
|checkout_id|string|false|none|none|
|currency|string|false|none|none|
|state|string|false|none|none|
|payment_method|string|false|none|none|
|crypto_currency|string|false|none|none|
|amount|number|false|none|none|
|sub_state|string|false|none|none|
|unresolved_id|integer(int64)|false|none|none|
|remain_amount|number|false|none|none|
|bill_address|string|false|none|none|
|charge_url|string|false|none|none|
|order_identifier|string|false|none|none|
|sub_state_code|integer(int32)|false|none|none|
|paid_base_amount|number|false|none|none|
|name|string|false|none|none|
|paid_amount|number|false|none|none|
|external_order_id|string|false|none|none|
|customer_name|string|false|none|none|
|state_code|integer(int32)|false|none|none|
|recipient_name|string|false|none|none|
|order_id|integer(int64)|false|none|none|
|cancel_url|string|false|none|none|
|redirect_url|string|false|none|none|
|required_info|[ChargeOrderRequired](#schemachargeorderrequired)|false|none|none|

<h2 id="tocS_ChargeOrderPayment">ChargeOrderPayment</h2>
<!-- backwards compatibility -->
<a id="schemachargeorderpayment"></a>
<a id="schema_ChargeOrderPayment"></a>
<a id="tocSchargeorderpayment"></a>
<a id="tocschargeorderpayment"></a>

```json
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

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|base_currency|string|false|none|none|
|amount|number|false|none|none|
|tx_hash|string|false|none|none|
|network|string|false|none|none|
|detected_at|integer(int64)|false|none|none|
|base_amount|number|false|none|none|
|currency|string|false|none|none|
|block|[ChargeOrderTxBlock](#schemachargeordertxblock)|false|none|none|
|state|string|false|none|none|
|tx_index|integer(int32)|false|none|none|
|state_code|integer(int32)|false|none|none|
|confirmed_at|integer(int64)|false|none|none|
|from_address|string|false|none|none|

<h2 id="tocS_ApiResponseChargeOrderDto">ApiResponseChargeOrderDto</h2>
<!-- backwards compatibility -->
<a id="schemaapiresponsechargeorderdto"></a>
<a id="schema_ApiResponseChargeOrderDto"></a>
<a id="tocSapiresponsechargeorderdto"></a>
<a id="tocsapiresponsechargeorderdto"></a>

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

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|code|integer(int32)|false|none|none|
|data|[ChargeOrderDto](#schemachargeorderdto)|false|none|none|
|message|string|false|none|none|
|error|object|false|none|none|
|status|integer(int32)|false|none|none|

<h2 id="tocS_ChargeOrderTxBlock">ChargeOrderTxBlock</h2>
<!-- backwards compatibility -->
<a id="schemachargeordertxblock"></a>
<a id="schema_ChargeOrderTxBlock"></a>
<a id="tocSchargeordertxblock"></a>
<a id="tocschargeordertxblock"></a>

```json
{
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
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|network_id|integer(int64)|false|none|none|
|tx_count|integer(int32)|false|none|none|
|accumulated_confirmed|integer(int32)|false|none|none|
|best_height|integer(int64)|false|none|none|
|prev_hash|string|false|none|none|
|required_confirmed|integer(int32)|false|none|none|
|best_hash|string|false|none|none|
|time|integer(int64)|false|none|none|
|next_hash|string|false|none|none|
|hash|string|false|none|none|
|forked|boolean|false|none|none|
|height|integer(int64)|false|none|none|

<h2 id="tocS_ChargeOrderPrice">ChargeOrderPrice</h2>
<!-- backwards compatibility -->
<a id="schemachargeorderprice"></a>
<a id="schema_ChargeOrderPrice"></a>
<a id="tocSchargeorderprice"></a>
<a id="tocschargeorderprice"></a>

```json
{
  "amount": 0,
  "last_update": 0,
  "currency": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|number|false|none|none|
|last_update|integer(int64)|false|none|none|
|currency|string|false|none|none|

<h2 id="tocS_ChargePublicUpdateDto">ChargePublicUpdateDto</h2>
<!-- backwards compatibility -->
<a id="schemachargepublicupdatedto"></a>
<a id="schema_ChargePublicUpdateDto"></a>
<a id="tocSchargepublicupdatedto"></a>
<a id="tocschargepublicupdatedto"></a>

```json
{
  "customer_name": "string",
  "bill_address": "string",
  "payment_method": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|customer_name|string|false|none|none|
|bill_address|string|false|none|none|
|payment_method|string|false|none|none|

<h2 id="tocS_ChargeOrderRefund">ChargeOrderRefund</h2>
<!-- backwards compatibility -->
<a id="schemachargeorderrefund"></a>
<a id="schema_ChargeOrderRefund"></a>
<a id="tocSchargeorderrefund"></a>
<a id="tocschargeorderrefund"></a>

```json
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

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|detected_at|integer(int64)|false|none|none|
|amount|number|false|none|none|
|fee|number|false|none|none|
|to_address|string|false|none|none|
|currency|string|false|none|none|
|tx_hash|string|false|none|none|
|block|[ChargeOrderTxBlock](#schemachargeordertxblock)|false|none|none|
|state|string|false|none|none|
|state_code|integer(int32)|false|none|none|
|confirmed_at|integer(int64)|false|none|none|
|tx_index|integer(int32)|false|none|none|
|network|string|false|none|none|

<h2 id="tocS_ChargeOrderRequired">ChargeOrderRequired</h2>
<!-- backwards compatibility -->
<a id="schemachargeorderrequired"></a>
<a id="schema_ChargeOrderRequired"></a>
<a id="tocSchargeorderrequired"></a>
<a id="tocschargeorderrequired"></a>

```json
{
  "customer_name": true,
  "bill_address": true,
  "payment_method": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|customer_name|boolean|false|none|none|
|bill_address|boolean|false|none|none|
|payment_method|boolean|false|none|none|

<h2 id="tocS_ApiResponse">ApiResponse</h2>
<!-- backwards compatibility -->
<a id="schemaapiresponse"></a>
<a id="schema_ApiResponse"></a>
<a id="tocSapiresponse"></a>
<a id="tocsapiresponse"></a>

```json
{
  "code": 0,
  "data": {},
  "message": "string",
  "error": {},
  "status": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|code|integer(int32)|false|none|none|
|data|object|false|none|none|
|message|string|false|none|none|
|error|object|false|none|none|
|status|integer(int32)|false|none|none|

<h2 id="tocS_ChargeCreateDto">ChargeCreateDto</h2>
<!-- backwards compatibility -->
<a id="schemachargecreatedto"></a>
<a id="schema_ChargeCreateDto"></a>
<a id="tocSchargecreatedto"></a>
<a id="tocschargecreatedto"></a>

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

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|metadata|string|false|none|none|
|price|number|true|none|none|
|name|string|true|none|none|
|external_order_id|string|true|none|none|
|currency|string|true|none|none|
|type|string|false|none|none|

