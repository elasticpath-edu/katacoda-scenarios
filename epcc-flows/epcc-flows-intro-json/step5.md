### Get a Customers Wishlists

Check the `customer` resource to confirm that the wishlist(s) are returned directly on the data object.

* Open the `Get a customer` request from `customers` folder.
* Add a new query parameter in `Params` section with `include` as the key and `wishlists` as the value.
* Click `Send`.

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
          "type": "wishlist",
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

