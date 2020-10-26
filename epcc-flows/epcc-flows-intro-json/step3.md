
Flows allow you to extend an existing or create a new resource.

|Attribute|	Type|	Description|
|------------|--------------|----------|
|id|	string|	The unique identifier for this flow.|
|type|	string|	Represents the type of object being returned.|
|name|	string|	The name of the flow.|
|slug|	string|	A unique slug identifier for the flow.|
|description|	string|	Any description for this flow.|
|enabled|	bool|	true if enabled, false if not.|

#### GET - Get a Flow

```url
https://api.moltin.com/v2/flows/:id
```

#### POST - Create a Flow

```url
https://api.moltin.com/v2/flows
```

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|enabled|	Required|	boolean|	true if enabled, false if not.|
|description|	Required|	string|	Any description for this flow.|
|slug|	Required|	string|	A unique slug identifier for the flow.|
|name|	Required|	string|	The name of the flow.|
|type|	Required|	string|	Represents the type of object being returned.|

#### PUT - Update a Flow

```url
https://api.moltin.com/v2/flows/:id
```

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|id|	Required|	string|	The ID of the flow you’re updating.|
|enabled|	Required|	boolean|	true if enabled, false if not.|
|description|	Required|	string|	Any description for this flow.|
|slug|	Required|	string|	A unique slug identifier for the flow.|
|name|	Required|	string|	The name of the flow.|
|type|	Required|	string|	Represents the type of object being returned.|

#### DELETE - Delete a Flow

```
https://api.moltin.com/v2/flows/:id
```
|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|id|	Required|	string|	The ID for the field you are requesting to be deleted.|

## Create a Custom Flow

Complete the following steps to create a custom Flow:

* Open the collection in the editor
* Open the `Create a flow` request and replace the contents in the `Body` section with:

<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#FLOW-BODY">
{\"data\": {\"type\": \"flow\",\"name\": \"Wishlists\",\"slug\": \"wishlists\",\"description\": \"Allow customers to store products they want to purchase at a later date\",\"enabled\": true}}
</pre>
> Remove any extra line breaks inserted in the raw data above.

* Send the request to create a flow and return the flow ID and slug that will be saved in `flowID` and `flowSlug` environment variables by the test script.

`newman run collection.json --folder "Create a flow" -e environment.json --export-environment environment.json`{{execute}}