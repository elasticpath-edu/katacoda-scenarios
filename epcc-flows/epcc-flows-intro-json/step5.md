An Entry is a specific instance of a Flow, and is associated with a specific instance of an entity, such as a single product. Entries for core Flows (existing resources) are managed automatically for you.

In database terms, you can think of Flows as tables, Fields as columns, and Entries as database records.

|Attribute|	Type|	Description|
|------------|--------------|----------|
|id|	string|	The unique identifier for this entry.|
|type|	string|	Represents the type of object being returned.|
|fieldSlug|	mixed|	There can be a :fieldSlug attribute for each field attached to the flow. The type depends on the field type.|


## Create an Entry in the Custom Flow (Wishlist)

With the custom Flow configured, next you will create an empty wishlist Entry and then add product IDs to it.

### Create an Empty Wishlist (Flow Entry)

* Open the collection in the editor
* Open the `Create an entry` request
* Replace the contents in the body section with:

<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#ENTRY-BODY">
{\"data\": {\"type\": \"entry\"}}
</pre>
> Remove any extra line breaks inserted in the raw data above.

* Send the request to create an empty entry and return the entry ID to be saved in `entryID` environment variable by the test script.

`newman run collection.json --folder "Create an entry" -e environment.json --export-environment environment.json`{{execute}}

> In next step, you will create a relationship from this entry to the products.