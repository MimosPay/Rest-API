# Guides

## Accept payments via MimosPay

To accept payments via MimosPay, a token will need to be sent with the API request.
And the API request will be requiring cryptographically signing before sent.

### Getting API Key

You can generate a token directly from the `Settings -> API Keys` page.

  1. Click `Add API Key`
  2. Fill the form parameters
    * Label, (e.g. My MimosPay Client)
    * Success Redirect URL
    * Failure Redirect URL
    * Webhook URL, to receive the events which push by MimosPay
  3. Click Button `Generate API KEY`
  4. Save your API Key and API Secret either click the `Copy API KEY` or copy them manually

  **Note**:

  - `API Key (APP_ID)` It is used in API request
  - `API Secrect` It is used to generate the signature (and only visible once after creation)

### Signing request<a name="signing_request"></a>

> Request Body Example

```json
{
  "external_order_id":"3qqx2a6vd96x67c91cplq",
  "name":"iphone 11",
  "price":"599",
  "currency":"USD",
  "metadata":"{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}"
}
```

```shell
# Assume the API key is '6e1dd7ce21874898b0b77b3288f006fa'
A = 'X-MM-APP-ID=6e1dd7ce21874898b0b77b3288f006fa&external_order_id=3qqx2a6vd96x67c91cplq&name=iphone 11&price=599&currency=USD&metadata={"image_url":"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg","customer_id":"123456","customer_name":"my-user-name"}&X-MM-TIMESTAMP=1594647652397&X-MM-NONCE=2hjkr7iveci'

stringA= 'X-MM-APP-ID=6e1dd7ce21874898b0b77b3288f006fa&X-MM-NONCE=2hjkr7iveci&X-MM-TIMESTAMP=1594647652397&currency=USD&external_order_id=3qqx2a6vd96x67c91cplq&metadata={"image_url":"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg","customer_id":"123456","customer_name":"my-user-name"}&name=iphone 11&price=599'

# Assume the API Secret is '1bbbwkGuHBZhnVatOrglZyeiBzuOvYvKgNvzZCWlQHqh6m0uHWpE5h95H62BSnymJL'
stringB= stringA + '&key=1bbbwkGuHBZhnVatOrglZyeiBzuOvYvKgNvzZCWlQHqh6m0uHWpE5h95H62BSnymJL'

# MD5, '416D616F6F796778DAC3EEF2F179739D'
signatureVal = MD5(stringB).toUpperCase()

# HmacSHA256, '6BCABDD525CAE130F52D614C4F7B26727C6EDFD28777A2A76B717002E7136721'
signatureVal = HmacSHA256(stringB, secrect).toUpperCase()
```

> Request samples

```shell
# You can also use wget
curl -X POST https://api.mimos.io/crypto-checkout/v1/charges \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'X-MM-APP-ID: 6e1dd7ce21874898b0b77b3288f006fa' \
  -H 'X-MM-TIMESTAMP: 1594127461389' \
  -H 'X-MM-SIGNATURE: 416D616F6F796778DAC3EEF2F179739D' \
  -H 'X-MM-NONCE: 2hjkr7iveci'
  --data-binary '{"external_order_id":"3qqx2a6vd96x67c91cplq","name":"iphone 11","price":"599","currency":"USD","metadata":"{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}"}'
```

```javascript--node
const fetch = require('node-fetch');
const inputBody = {
  "metadata": "{\"image_url\":\"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\",\"customer_id\":\"123456\",\"customer_name\":\"my-user-name\"}",
  "price": "599",
  "name": "iphone 11",
  "external_order_id": "3qqx2a6vd96x67c91cplq",
  "currency": "USD"
};
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'X-MM-APP-ID':'6e1dd7ce21874898b0b77b3288f006fa',
  'X-MM-TIMESTAMP':'1594127461389',
  'X-MM-SIGNATURE':'416D616F6F796778DAC3EEF2F179739D',
  'X-MM-NONCE':'2hjkr7iveci'
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
        "X-MM-TIMESTAMP": []string{"1594127461389"},
        "X-MM-SIGNATURE": []string{"416D616F6F796778DAC3EEF2F179739D"},
        "X-MM-NONCE": []string{"2hjkr7iveci"},
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
  'X-MM-APP-ID': '6e1dd7ce21874898b0b77b3288f006fa',
  'X-MM-TIMESTAMP': '1594127461389',
  'X-MM-SIGNATURE': '416D616F6F796778DAC3EEF2F179739D',
  'X-MM-NONCE': '2hjkr7iveci'
}

r = requests.post('https://api.mimos.io/crypto-checkout/v1/charges', data = payload, headers = headers)

print(r.json())

```

1. Prepare the request headers and body
  * `X-MM-APP-ID`, [your API Key][mimos-pay-settings]
  * `X-MM-TIMESTAMP`, the UTC timestamp when API request, the unit is millisecond. The client timestamp included with the request must be within 5 minutes of the MimosPay system time when the request is received. If not, the request will fail with the `Invalid X-MM-TIMESTAMP` error.
  * `X-MM-NONCE`, an unique string to enforce idempotence for POST requests
  * request payload

2. Sort the params by the non-empty key's ASCII in the ascending order and concatenate into `stringA` with URL key-value format(i.e. key1=value1&key2=value2…).<br /><br />
Pay attention to below rules:
  * Sort the params name in the ASCII ascending order
  * The param with empty value is ignored
  * The param name are case sensitive
  * If the value is object, stringify the object to a JSON string.

3. Append the API Secrect to `stringA` with param name `key` as `stringB`
4. Use MD5 encode `stringB` and convert all characters to uppercasee to get the `signatureVal`.

### Making request

For more details, please refer to [Create a charge](/#create-a-charge)

### Receiving events

> Webhook Example - Headers

```json
[
  ...
  "X-MM-APP-ID": "6e1dd7ce21874898b0b77b3288f006fa"
  "X-MM-NONCE": "15aea03df5cb4f1092c6d15ad0460c59"
  "X-MM-SIGNATURE": "14D6A89E4FA1F60B00DB47B379BE3B52"
  "CONTENT-TYPE": "application/json"
  "CONTENT-LENGTH": 1354
  ...
]
```

> Webhook Example - Body Payload

```json
{
  "id": "tpxXfXTxY7",
  "type": "charge:complete",
  "create_at": "2020-07-09T01:23:04.632Z",
  "data": {
    "order_identifier": "3v9YNZzCpG4ltpwgdFDcTR",
    "external_order_id": "nk8yl77ffy8m74oxq0f9gi",
    "name": "iphone 11",
    "amount": "599",
    "currency": "CNY",
    "payment_method": "ethereum",
    "type": "FIXED_VALUE",
    "created_at": "1594300750683",
    "expired_at": "1594301050683",
    "state": "COMPLETE",
    "sub_state": "NONE",
    "addresses": {
      "ethereum": "0x983eB33A8Bf4D17A600dEaC6cb95E94CF1F3D8EB"
    },
    "payments": [
      {
        "network": "ethereum",
        "tx_hash": "0x8d86e3e73aba33806e830a034d1442cd286380c6ff8d989e66d8d3afaaaf35d5",
        "tx_index": "2",
        "amount": "0.352212",
        "currency": "ETH",
        "base_amount": "599",
        "state": "COMPLETE",
        "detected_at": "1594300924112",
        "confirmed_at": "1594300984154",
        "block": {
          "network_id": "5",
          "height": "3016320",
          "hash": "0xf8933c1cebef545e9a5f8e3eacdd3633fc16d68f8290b0dacf5b1bc4ee0a44be",
          "time": "1594300924112",
          "required_confirmed": "6",
          "accumulated_confirmed": "6",
          "forked": false
        }
      }
    ],
    "metadata": "{\"image_url\": \"https://images-na.ssl-images-amazon.com/images/I/61wjAvw5B2L._AC_SX425_.jpg\", \"customer_id\": \"123456\", \"customer_name\": \"my-user-name\"}",
    "charge_url": "https://w.dev.mimos.io/crypto-checkout/3v9YNZzCpG4ltpwgdFDcTR",
    "required_info": {
      "bill_address": true,
      "customer_name": false
    },
    "bill_address": "test@mimos.io",
    "recipient_name": "test-new-api",
    "crypto_amount": "0.352212",
    "crypto_currency": "ETH"
  }
}
```

You can receive the event if adding a webhook subscription in [setting][mimos-pay-settings].

Every MimosPay webhook request includes headers,

  * `X-MM-APP-ID`, [your API Key][mimos-pay-settings]
  * `X-MM-NONCE`, an unique string to enforce idempotence for POST requests
  * `X-MM-SIGNATURE`, MD5 signature of the request body `data` field, computed using your webhook shared secret of the API Key.

Always make sure that you verify the webhook signature before acting on it inside your system.

The signature content,

  * `X-MM-APP-ID`
  * `X-MM-NONCE`
  * `event.data` in request payload

And signing the content by follow the [rules](#webhooks)

For more details, please refer to [Resource - Event](#event).

[mimos-pay-settings]: https://w.mimos.io/commerce/en/settings
