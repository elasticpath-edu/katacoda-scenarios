When you send the following **GET** request, the result should be something as shown below:

`newman run collection.json --folder "Get all customers" -e environment.json --export-environment environment.json`{{execute}}

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

If that's not the case, verify that you have followed all the steps. 

You can also verify the following from the **Dashboard** tab:

* Wishlist flow has been created as a non-core resource?
* Customers flow has been created to extend the core resource customer?
* Wishlist flow has a field called **Products** that is of type **relationship** and is **one-to-many**?
* Customers flow has a field called **wishlists** that is of type **relationship** and is **one-to-many**?