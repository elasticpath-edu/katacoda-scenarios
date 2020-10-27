Let's check the `customer` resource to confirm that the wishlist(s) are returned directly on the data object.

* Open the collection in the editor
* Open the `Get all customers` request. Make sure there is a query parameter `?include=wishlists` in the request
* Send the `GET` request:

`newman run collection.json --folder "Get all customers" -e environment.json --export-environment environment.json`{{execute}}