In this step, you will extend a core Flow `customers` to extend the Customer with a Field wishlists that will allow it to be connected to the custom resource `wishlists` from the previous exercise.

### Create Customers Flow

Check if you already have a Flow for the core resource `customer`.

* In Postman, open the `Get all fields on a flow` request from `flows` folder.
* Replace the Flow slug to `customers` as below.
![Customers Flow](images/flow-customers-get-postman.png)
* Click `Send`

>If the `customers` Flow already exists, you must add the returned `id` and the `slug` of the flow in new variables called `customersFlowID` and `customersFlowSlug` respectively, and skip the rest of this step.

![Customers Flow Variables](images/customers-flow-variables.png)

>If you get `Flow not found` error, continue as normal to create `customers` flow.

>You can get a list of all flows, IDs and slugs, by sending a GET request `Get all flows` in Postman.

Complete the following steps to extend the customers entity:

* In Postman, Open the `Create a flow` request.
* Replace the contents in the `Body` section with:

```json
{
  "data": {
    "type": "flow",
    "name": "Customers",
    "slug": "customers",
    "description": "Extends the default customer object",
    "enabled": true
  }
}
```

* Replace the contents in the `Tests` section with:

```js
const json = pm.response.json()
const d = json.hasOwnProperty("data") ? json.data : json
const id = Array.isArray(d) ? d[0].id : d.id
const slug = Array.isArray(d) ? d[0].slug : d.slug
pm.environment.set("customersFlowID", id)
pm.environment.set("customersFlowSlug", slug)
```

* Click `Send`

### Add Fields to the Customers Flow

Now, create a new Field of relationship type to link a customer to wishlists:

* In Postman, open the `Create a field` request.
* Replace the contents in the `body` section with:

```json
{
    "data": {
        "type": "field",
        "name": "Wishlists",
        "slug": "wishlists",
        "field_type": "relationship",
        "validation_rules": [{
            "type": "one-to-many",
            "to": "wishlists"
        }],
        "description": "Customers wishlists",
        "unique": false,
        "enabled": true,
        "required": false,
        "relationships": {
            "flow": {
                "data": {
                    "type": "flow",
                    "id": "{{customersFlowID}}"
                }
            }
        }
    }
}
```

* Replace the contents in the `Tests` section with:

```
const json = pm.response.json()
const d = json.hasOwnProperty("data") ? json.data : json
const id = Array.isArray(d) ? d[0].id : d.id
const slug = Array.isArray(d) ? d[0].slug : d.slug
pm.environment.set("wishlistFieldID", id)
pm.environment.set("wishlistFieldSlug", slug)
```

* Click `Send`

### Create a New Customer

* In Postman, open the `Create a customer` request from `customers` folder.
* Replace the data in the `Body` section with **your info**.
* Click `Send` to create a new customer Entry.

### Get a Customer's Wishlist

You’ve added a `wishlists` Field to the customer resource, so when you make the API call to get a customer, you must see the wishlist(s) directly on the customer data object.

* In Postman, open the `Get a customer` request from `customers` folder.
* Click `Send`.

>Wishlist Field must have `null` as the value. Don't worry, you will create entries in the next exercise.

[Next: Link a customer to a wishlist](./core-flow-entries.md)