Complete the following steps to create a custom Flow:

* Open the collection in the editor:

`/root/collection.json`{{open}}

* Open the `Create a flow` request and replace the contents in the `Body` section with:

<pre class="file" data-filename="epcc-flows.json" data-target="insert" data-marker="#FLOW-BODY">
{
    \"data\": {
    \"type\": \"flow\",
    \"name\": \"Wishlists\",
    \"slug\": \"wishlists\",
    \"description\": \"Allow customers to store products they want to purchase at a later date\",
    \"enabled\": true
    }
}
</pre>

* Send the request to create a flow and return the flow ID and slug that will be saved in `flowID` and `flowSlug` environment variables by the script.

`newman run epcc-flows.json --folder "Create a flow" -e environment.json --verbose --export-environment environment.json`{{execute}}

### Add a Field to the Custom Flow

In this step, you will create a Field `products` to store the customers' desired products.

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Open the `Create a field` request.
* Replace the contents in the body section with::

<pre class="file" data-filename="epcc-flows.json" data-target="insert" data-marker="#PRODUCT-BODY">
{
    \"data\": {
        \"type\": \"field\",
        \"name\": \"Products\",
        \"slug\": \"products\",
        \"field_type\": \"relationship\",
        \"validation_rules\": [{

            \"type\": \"one-to-many\",
            \"to\": \"products\"
        }],
        \"description\": \"Wishlist Products\",
        \"required\": false,
        \"enabled\": true,
        \"relationships\": {
            \"flow\": {
                \"data\": {
                    \"type\": \"flow\",
                    \"id\": \"{{flowID}}\"
                }
            }
        }
    }
}
</pre>

`newman run epcc-flows.json --folder "Create a field" -e environment.json --verbose --export-environment environment.json`{{execute}}

* Send the request to create a field and return the field ID and field slug that will be saved in `fieldID` and `fieldSlug` environment variables by the script.

### Get the Wishlist Fields

You've created a custom resource with a relationship Field to store the product IDs. Next, send a GET request to get the resource and all fields on it:

`newman run epcc-flows.json --folder "Get all fields on a flow" -e environment.json --verbose`{{execute}}
