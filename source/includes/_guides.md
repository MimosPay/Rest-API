# I18n.t('guide.title') {#guides}

## I18n.t('guide.accept_payments') {#accept-payments-via-mimospay}

I18n.t('guide.note')

### I18n.t('guide.get_api_key') {#getting-api-key}

I18n.t('guide.get_api_key_note')

  1. I18n.t('guide.get_api_key_step1')
  2. I18n.t('guide.get_api_key_step2')
    * I18n.t('guide.get_api_key_step2_label')
    * I18n.t('guide.get_api_key_step2_succ_url')
    * I18n.t('guide.get_api_key_step2_fail_url')
    * I18n.t('guide.get_api_key_step2_cb_url')
  3. I18n.t('guide.get_api_key_step3')
  4. I18n.t('guide.get_api_key_step4')

  **I18n.t(:notic)**:

  - `API Key (APP_ID)` I18n.t('guide.api_key_note')
  - `API Secrect` I18n.t('guide.api_secrect_note')

### I18n.t('guide.signing_request') {#signing-request}

> Request Headers Example

```json
[
  ...
  "X-MM-APP-ID": "6e1dd7ce21874898b0b77b3288f006fa",
  "X-MM-TIMESTAMP": 1594127461389,
  "X-MM-NONCE": "2hjkr7iveci"
  ...
]
```

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

1. I18n.t('guide.signing_request_step1')
  * `X-MM-APP-ID`, [I18n.t(:your_api_key)][mimos-pay-settings]
  * `X-MM-TIMESTAMP`, I18n.t('guide.signing_request_step1_ts')
  * `X-MM-NONCE`, I18n.t('guide.signing_request_step1_nonce')
  * I18n.t('guide.signing_request_step1_payload')

2. I18n.t('guide.signing_request_step2')<br />
I18n.t('guide.signing_request_step2_note')
  * I18n.t('guide.signing_request_step2_rule1')
  * I18n.t('guide.signing_request_step2_rule2')
  * I18n.t('guide.signing_request_step2_rule3')
  * I18n.t('guide.signing_request_step2_rule4')

3. I18n.t('guide.signing_request_step3')
4. I18n.t('guide.signing_request_step4')

### I18n.t('guide.making_request') {#making-request}

I18n.t('guide.making_request_note')[I18n.t('charge.create_a_charge')](#create-a-charge)

### I18n.t('guide.receiving_events') {#receiving-events}

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

I18n.t('guide.receiving_events_note')

I18n.t('guide.receiving_events_webhook_note')

  * `X-MM-APP-ID`, [I18n.t(:your_api_key)][mimos-pay-settings]
  * `X-MM-NONCE`, I18n.t('guide.signing_request_step1_nonce')
  * `X-MM-SIGNATURE`, I18n.t('guide.receiving_events_webhook_signature')

I18n.t('guide.receiving_events_webhook_note2')

I18n.t('guide.receiving_events_webhook_signature_content')

  * `X-MM-APP-ID`
  * `X-MM-NONCE`
  * `event.data` I18n.t('guide.receiving_events_webhook_in_payload')

I18n.t('guide.receiving_events_webhook_rule')[I18n.t(:rules)](#webhooks)

I18n.t('guide.making_request_note')[Resource - Event](#schema-event).

[mimos-pay-settings]: https://w.mimos.io/commerce/en/settings
