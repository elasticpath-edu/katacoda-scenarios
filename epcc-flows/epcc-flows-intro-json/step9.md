Let's check the `customer` resource to confirm that the wishlist(s) are returned directly on the data object.

* Open the collection in the editor
* Open the `Get all customers` request. Make sure there is a query parameter `?include=wishlists` in the request
* Send the GET request for the customer

`newman run collection.json --folder "Get all customers" -e environment.json`{{execute}}

The result should be something like:

```json
{
  "data": {
    "id": "c8c1c511-beef-4812-9b7a-9f92c587217c",
    "type": "customer",
    "name": "John Smith",
    "email": "john@smith.com",
    "password": true,
    "relationships": [
      ("wishlists": [
        {
          "type": "wishlists",
          "id": "WISHLIST-ENTRY-ID"
        }
      ])
    ],
    "included": {
      "wishlists": [
        {
          "id": "WISHLIST-ENTRY-ID",
          "type": "entry",
          "relationships": {
            "products": {
              "data": [
                {
                  "type": "product",
                  "id": "ba9ba29d-06da-4ba9-9e2e-f0e776703324"
                },
                {
                  "type": "product",
                  "id": "394916e8-1d47-44a0-b5d0-a5a61b71bab8"
                }
              ]
            }
          }
        }
      ]
    }
  }
}
```

