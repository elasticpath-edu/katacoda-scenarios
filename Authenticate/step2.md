## Authentication

In this exercise, you will attempt to access an API endpoint without authorization, see the error, then authenticate properly to receive a client credentials token. 

### Attempt to get products list

* Open the collection in the editor:

`/root/collection.json`{{open}}

* Explore the `Get all products` request under `products/get-all-products` folder.
* Send the request and you should receive a 401 error like the following: 

`newman run collection.json --folder get-all-products -e environment.json`{{execute}}

### Authenticate

* Explore the `Get client credentials token` request under `authentication/get-client-credentials-token` folder.
* Send the request to get the access token and save it in `accessToken` environment variable:

`newman run collection.json --folder get-client-credentials-token -e environment.json --export-environment environment.json`{{execute}}

> Client credentials token is valid for 30 minutes only. You can get a new token following the instructions above if you get a `401` error.

### Get products list with access token

* Send the request again and you should receive a 200 success this time: 

`newman run collection.json --folder get-all-products -e environment.json --verbose`{{execute}}
