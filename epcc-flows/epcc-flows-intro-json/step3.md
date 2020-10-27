
Flows allow you to extend an existing or create a new resource. For more details about the Flows API, visit the `Documentation` tab.

|Attribute|	Type|	Description|
|------------|--------------|----------|
|id|	string|	The unique identifier for this flow.|
|type|	string|	Represents the type of object being returned.|
|name|	string|	The name of the flow.|
|slug|	string|	A unique slug identifier for the flow.|
|description|	string|	Any description for this flow.|
|enabled|	bool|	true if enabled, false if not.|


## Create a Custom Flow

Complete the following steps to create a custom Flow:

* Open the collection.json in the editor
* Open the `Create a flow` request and replace the contents in the `Body` section with:
> Click the `Copy to Clipboard` button to insert the below text in the body of the request. Make s
<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#FLOW-BODY">
{\"data\": {\"type\": \"flow\",\"name\": \"Wishlists\",\"slug\": \"wishlists\",\"description\": \"Allow customers to store products they want to purchase at a later date\",\"enabled\": true}}
</pre>
> Remove any extra line breaks inserted in the raw data above.

* Send the request to create a flow and return the flow ID and slug that will be saved in `flowID` and `flowSlug` environment variables by the test script.

`newman run collection.json --folder "Create a flow" -e environment.json --export-environment environment.json`{{execute}}