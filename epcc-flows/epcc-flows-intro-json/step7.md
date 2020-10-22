In this step, you will extend a core Flow `customers` to extend the Customer with a Field wishlists that will allow it to be connected to the custom resource `wishlists` from the previous exercise.

### Create Customers Flow

Check if you already have a Flow for the core resource `customer`.

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Explore the `Get all fields on customer flow` request.
* Send the request to get all fields on the `customers` flow, if it exists.

`newman run epcc-flows.json --folder "Get all fields on customer flow" -e environment.json --verbose --export-environment environment.json`{{execute}}

>If the `customers` flow already exists, it is returned. You should open the environment file and replace `null` to update environment variables named `customersFlowID` and `customersFlowSlug`.
`environment.json`{{open}}

If last command returned with `Flow not found` error, complete the following steps to extend the customers entity:

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Open the `Create a customer flow` request and replace the contents in the `Body` section with:

<pre class="file" data-filename="epcc-flows.json" data-target="insert" data-marker="#CUST-FLOW-BODY">
{\"data\": {\"type\": \"flow\",\"name\": \"Customers\",\"slug\": \"customers\",\"description\": \"Extends the default customer object\",\"enabled\": true}}
</pre>

* Send the request to create a flow and return the flow ID and slug that will be saved in `customersFlowID` and `customersFlowSlug` environment variables by the test script.

`newman run epcc-flows.json --folder "Create a customer flow" -e environment.json --verbose --export-environment environment.json`{{execute}}

### Add Fields to the Customers Flow

Now, create a new Field of relationship type to link a customer to wishlists:

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Open the `Create a wishlist field` request and replace the contents in the `Body` section with:

<pre class="file" data-filename="epcc-flows.json" data-target="insert" data-marker="#WISH-FIELD-BODY">
{\"data\": {\"type\": "\field\","\name\": "\Wishlists\","\slug\": "\wishlists\","\field_type\": "\relationship\","\validation_rules\": [{"\type\": "\one-to-many\","\to\": "\wishlists\"}],"\description\": "\Customers wishlists\","\unique\": false,"\enabled\": true,"\required\": false,"\relationships\": {"\flow\": {"\data\": {"\type\": "\flow\","\id\": "\{{customersFlowID}}\"}}}}}
</pre>

* Send the request to create a field and return the field ID and the field slug that will be saved in `wishlistFieldID` and `wishlistFieldSlug`  environment variables respectively by the test script.

`newman run epcc-flows.json --folder "Create a wishlist field" -e environment.json --verbose --export-environment environment.json`{{execute}}

### Create a New Customer

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Open the `Create a customer` request and replace the data in the `Body` section with **your info**.
* Send the request to create a customer and return the customer ID to be saved in `customerID` environment variable by the test script.

`newman run epcc-flows.json --folder "Create a customer" -e environment.json --verbose --export-environment environment.json`{{execute}}


### Get a Customer's Wishlist

Now, that you’ve added a `wishlists` Field to the customer resource, when you make the API call to get a customer, you must see the wishlist(s) directly on the customer data object.

* Send the `Get a customer` request to get the customer.

`newman run epcc-flows.json --folder "Get a customer" -e environment.json --verbose`{{execute}}

> Wishlist Field must have `null` as the value. Don't worry, you will create entries in the next exercise.