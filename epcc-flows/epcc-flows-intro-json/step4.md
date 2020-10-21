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

#### GET - Get all Fields

```url
https://api.moltin.com/v2/fields
```

#### GET - Get all Fields by Flow

```url
https://api.moltin.com/v2/flows/:slug/fields
```

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|slug|	Required|	string|	The slug of the Flow you want to return fields for.|

#### GET - Get a Field

```url
https://api.moltin.com/v2/fields/:id
```

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|id|	Required|	string|	The ID for the field you are requesting.|

#### POST - Create a Field

```url
https://api.moltin.com/v2/fields
```

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|type|	Required|	string|	Represents the type of object being returned.|
|name|	Required|	string|	The name of the field.|
|slug|	Required|	string|	A unique slug identifier for the field.|
|field_type|	Required|	string|	The type of field - string, integer, boolean, float, date, relationship.|
|description|	Required|	string|	Any description for this field.|
|required|	Required|	boolean|	true if required on input, false if not. Always false if the field_type is a relationship.|
|default|	Optional|	string|	A default value if none is supplied and field is not required.|
|enabled|	Required|	boolean|	If this field is enabled on the flow this should be true, otherwise false.|
|order|	Optional|	integer|	Denotes the order in which this field is returned relative to the rest of the flow fields.|
|omit_null|	Optional|	boolean|	Omit this field from responses if the value is null.|
|relationships|	Required|	object|	A relationship object to link this field to a flow.|

#### PUT - Update a Field

```url
https://api.moltin.com/v2/fields/:id
```

**Path Parameters:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|id|	Required|	string|	The ID of the field you’re requesting to be updated.|

**Body:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|type|	Required|	string|	Represents the type of object being returned.|
|name|	Required|	string|	The name of the field.|
|slug|	Required|	string|	A unique slug identifier for the field.|
|description|	Required|	string|	Any description for this field.|
|required|	Required|	boolean|	true if required on input, false if not. Always false if the field_type is a relationship.|
|default|	Optional|	string|	A default value if none is supplied and field is not required.|
|enabled|	Required|	boolean|	If this field is enabled on the flow this should be true, otherwise false.|
|order|	Optional|	integer|	Denotes the order in which this field is returned relative to the rest of the flow fields.|
|omit_null|	Optional|	boolean|	Omit this field from responses if the value is null.|
|relationships|	Required|	object|	A relationship object to link this field to a flow.|

#### DELETE - Delete a Field

```
https://api.moltin.com/v2/fields/:id
```
|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|id|	Required|	string|	The ID for the field you are requesting to be deleted.|


## Add a Field to the Custom Flow

In this step, you will create a Field `products` to store the customers' desired products.

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Open the `Create a field` request.
* Replace the contents in the body section with:

<pre class="file" data-filename="epcc-flows.json" data-target="insert" data-marker="#FIELD-BODY">
{\"data\": {\"type\": \"field\",\"name\": \"Products\",\"slug\": \"products\",\"field_type\": \"relationship\",
\"validation_rules\": [{\"type\": \"one-to-many\",\"to\": \"products\"}],\"description\": \"Wishlist Products\",\"required\": false,\"enabled\": true,\"relationships\": {\"flow\": {\"data\": {\"type\": \"flow\",\"id\": \"{{flowID}}\"}}}}}
</pre>

`newman run epcc-flows.json --folder "Create a field" -e environment.json --verbose --export-environment environment.json`{{execute}}

* Send the request to create a field and return the field ID and field slug that will be saved in `fieldID` and `fieldSlug` environment variables by the script.

### Get the Wishlist Fields

You've created a custom resource with a relationship Field to store the product IDs. Next, send a GET request to get the resource and all fields on it:

`newman run epcc-flows.json --folder "Get all fields on a flow" -e environment.json --verbose`{{execute}}