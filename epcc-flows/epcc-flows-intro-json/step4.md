Fields and Entries are an integral part of Flows. A Flow describes a collection of Fields. A Field represents a single field of data.

|Attribute|	Type|	Description|
|------------|--------------|----------|
|Attribute|	Type|	Description|
|id|	string|	The unique identifier for this field.
|type|	string|	Represents the type of object being returned.|
|name|	string|	The name of the field.|
|slug|	string|	A unique slug identifier for the field.
|field_type|	string|	This field is immutable and cannot be updated. The type of field: string, integer, boolean, float, date, or relationship.|
|validation_rules|	array[object]|	See Flow Field Validation Rules.|
|description	|string|	Any description for this field.|
|required|	boolean|	true if required on input, false  if not. Always false if the field_type is a relationship.|
|default|	mixed|	A default value if none is supplied and field is not required.|
|enabled|	boolean|	If this field is enabled on the flow this should be true, otherwise false.|
|order|	integer|	Denotes the order in which this field is returned relative to the rest of the flow fields.|
|relationships|	object|	A relationship object to link this field to a flow.|
|omit_null|	boolean|	Hide this field from responses if the value is null.|


## Add a Field to the Custom Flow

In this step, you will create a Field `products` to store the customers' desired products.

* Open the collection from `collection.json`{{open}} in the editor
* Replace the contents in the body section of the `Create an field` request with the text below:
> Click the `Copy to Clipboard` button to insert the text in the editor.
> Remove any extra line breaks inserted with the raw data.

<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#FIELD-BODY">
{\"data\": {\"type\": \"field\",\"name\": \"Products\",\"slug\": \"products\",\"field_type\": \"relationship\",
\"validation_rules\": [{\"type\": \"one-to-many\",\"to\": \"products\"}],\"description\": \"Wishlist Products\",\"required\": false,\"enabled\": true,\"relationships\": {\"flow\": {\"data\": {\"type\": \"flow\",\"id\": \"{{flowID}}\"}}}}}
</pre>

* Send the request to create a field and return the field ID and field slug that will be saved in `fieldID` and `fieldSlug` environment variables by the script.

`newman run collection.json --folder "Create a field" -e environment.json --export-environment environment.json`{{execute}}

### Get the Wishlist Fields

You've created a custom resource with a relationship Field to store the product IDs. Next, send a GET request to get the resource and all fields on it:

`newman run collection.json --folder "Get all fields on a flow" -e environment.json`{{execute}}