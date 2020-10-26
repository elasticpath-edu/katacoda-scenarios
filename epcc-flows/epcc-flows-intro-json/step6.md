When you create a field that uses relationship as a field_type, you update your entry values using the Relationship endpoints.

#### POST - Create Entry Relationship

```url
https://api.moltin.com/v2/flows/:flowSlug/entries/:entryId/relationships/:fieldSlug
```

Create an Entry relationship to one or more resources. If any relationships already exist, the ones made in the request are added to them.

**Path Parameters:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|fieldSlug|	Required|	string|	The slug of the entry this field belongs to.|
|flowSlug|	Required|	string|	The slug for the Flow the entry belongs to.|
|entryId|	Required|	string|	The ID of the entry this field belongs to.|

**Body:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|data.id|	Optional|	string|	The ID of the related resource.|
|data.type|	Optional|	string|	Represents the resource type of the object.|
|data.id|	Optional|	string|	Data to be stored.|

#### PUT - Update Entry Relationship

```url
https://api.moltin.com/v2/flows/:flowSlug/entries/:entryId/relationships/:fieldSlug
```

Replace the relationships between an entry and a resource. Unlike a POST to this endpoint, a PUT overrides any existing relationships.

**Path Parameters:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|fieldSlug|	Required|	string|	The slug of the entry this field belongs to.|
|flowSlug|	Required|	string|	The slug for the Flow the entry belongs to.|
|entryId|	Required|	string|	The ID of the entry this field belongs to.|

**Body:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|data.id|	Optional|	string|	The ID of the related resource.|
|data.type|	Optional|	string|	Represents the resource type of the object.|
|data.id|	Optional|	string|	Data to be stored.|

#### DELETE - Delete Entry Relationship

```url
https://api.moltin.com/v2/flows/:flowSlug/entries/:entryId/relationships/:fieldSlug
```

Remove all relationships between an entry and resources.

**Path Parameters:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|fieldSlug|	Required|	string|	The slug of the entry this field belongs to.|
|flowSlug|	Required|	string|	The slug for the Flow the entry belongs to.|
|entryId|	Required|	string|	The ID of the entry this field belongs to.|


### Add Product IDs to the Wishlist (Relationship Entry)

With the custom Flow Entry, now you can associate products with a wishlist Entry. Start by creating a new product:

* Open the collection in the editor
* Open the `Create a product` request
* Replace the contents in the body section with:

<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#PRODUCT-BODY">
{\"data\": {\"type\": \"product\",\"name\" : \"Playtend Switch Controller Pro Slim\",\"slug\": \"playtend-switch-controller-pro-slim\", \"sku\": \"PSAL01-{COLOUR}-1\",\"manage_stock\": false,\"description\": \"Playtend Switch Controller Pro Slim\",\"status\" : \"live\",\"commodity_type\": \"physical\",\"price\": [{ \"amount\": 7000, \"currency\": \"USD\", \"includes_tax\": true}]}}
</pre>
> Remove any extra line breaks inserted in the raw data above.

* Send the request to create a new product and return the product ID that will be saved in `productID` environment variable by the test script.

`newman run collection.json --folder "Create a product" -e environment.json --export-environment environment.json`{{execute}}

* Open the collection in the editor
* Open the `collectionentry relationship` request
* Replace the contents in the body section with:

<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#ENTRY-REL-BODY">
{\"datacollectionpe\": \"product\",\"id\": \"{{productID}}\"}]}
</pre>
> Remove any extra line breaks inserted in the raw data above.

* Send the request to create a new entry relationship connecting the product to the wishlist.

`newman run collection.json --folcollectione an entry relationship" -e environment.json`{{execute}}

>You can repeat these steps to add more products to the wishlist Entry. Use `Get all products` from `products` folder, to get a list of all the products.

`newman run collection.json --folder "Get all products" -e environment.json --export-environment environment.json`{{execute}}

### Get all entries

* Run `Get all entries on a flow` request.

`newman run collection.json --folder "Get all entries on a flow" -e environment.json --verbose`{{execute}}

>The response must contain the associated products **per Entry** like below.

```json
{
  "data": [
      {
          "id": "58f1dd97-6bc3-4f30-9256-a82defbb9888",
          "type": "entry",
          ...
          ...
          "relationships": {
              "products": {
                  "data": [
                      {
                          "type": "product",
                          "id": "a0226e72-4b74-4927-97be-77bae20cc1db"
                      },
                      {
                          "type": "product",
                          "id": "2de8a081-0690-4511-89be-6c2819422f21"
                      }
                  ]
              }
          }
      }
  ]
}
```