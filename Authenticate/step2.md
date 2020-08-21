## Authentication

In this exercise, you will attempt to access an API endpoint without authorization, see the error, then authenticate properly to receive a client credentials token. 

### Attempt to get products list

* Explore the `Get all products` request under `products/get-all-products` folder.
* Send the request and you should receive a 401 error like the following: 

`newman run /root/collection.json --folder products/get-all-products -e /root/environment.json`{{execute}}

### Authenticate

### Attempt to get products list

* Explore the `Get client credentials token` request under `authenticate/get-client-credentials-token` folder.
* Send the request to get the access token and save it in `accessToken` environment variable:

`newman run /root/collection.json --folder authenticate/get-client-credentials-token -e /root/environment.json --export-environment new_environment.json`{{execute}}

> Client credentials token is valid for 30 minutes only. You can get a new token following the instructions above if you get a `401` error.