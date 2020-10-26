In this exercise, you will attempt to access an API endpoint without authorization, see the error, then authenticate properly to receive a client credentials token. 

### Attempt to get products list

* Open the collection file `/root/collection.json` in the editor
* Search and explore the `Get all products` request
* Send the request and you should receive a 401 error like the following: 

`newman run collection.json --folder "Get all products" -e environment.json`{{execute}}

### Set up the Training Environment

You will be using the API key from your training store to create a new environment in Postman.

>You can request a training store by following the instructions from the [Request a Training Store](https://elasticpath-customer.okta.com/app/litmos/exknrryohFKR6waw9356/sso/saml?RelayState=http://education.elasticpath.com/course/1913632) module.

* Go to https://dashboard.elasticpath.com/ and make note of your `Client ID` and `Client secret`.
* Open the `environment.json` file in the editor
* Replace `XXX` to update environment variables named `clientID` and `clientSecret`

> As you progress through the collection, additional variables will be created and used from request to request. You can confirm the value of any variable's current value from the environment.json file.

### Authenticate

* Explore the `Get client credentials token` request in the collection file `collection.json`
* Send the request to get the access token that will be saved in `accessToken` environment variable by the script.

`newman run collection.json --folder "Get client credentials token" -e environment.json --export-environment environment.json`{{execute}}

> Client credentials token is valid for 30 minutes only. You can get a new token following the instructions above if you get a `401` error.

### Get products list with access token

* Send the request again and you should receive a `200` success this time: 

`newman run collection.json --folder "Get all products" -e environment.json --verbose`{{execute}}