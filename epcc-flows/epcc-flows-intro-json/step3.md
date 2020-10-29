
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

* Open the postman collection from the `collection.json`{{open}} file in the editor
* Replace the contents in the body section of the `Create an flow` request with the text below:
> Click the `Copy to Clipboard` button to insert the text in the editor.
> Remove any extra line breaks inserted with the raw data.

<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#FLOW-BODY">
{\"data\": {\"type\": \"flow\",\"name\": \"Wishlists\",\"slug\": \"wishlists\",\"description\": \"Allow customers to store products they want to purchase at a later date\",\"enabled\": true}}
</pre>

* Send the request to create a flow and return the flow ID and slug that will be saved in `flowID` and `flowSlug` environment variables by the test script.

`newman run collection.json --folder "Create a flow" -e environment.json --export-environment environment.json`{{execute}}