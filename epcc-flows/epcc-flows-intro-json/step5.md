An Entry is a specific instance of a Flow, and is associated with a specific instance of an entity, such as a single product. Entries for core Flows (existing resources) are managed automatically for you.

In database terms, you can think of Flows as tables, Fields as columns, and Entries as database records.

|Attribute|	Type|	Description|
|------------|--------------|----------|
|id|	string|	The unique identifier for this entry.|
|type|	string|	Represents the type of object being returned.|
|fieldSlug|	mixed|	There can be a :fieldSlug attribute for each field attached to the flow. The type depends on the field type.|

#### GET - Get all Entries

```url
https://api.moltin.com/v2/flows/:slug/entries
```

#### GET - Get an Entry

```url
https://api.moltin.com/v2/flows/:slug/entries/:id
```

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|id|	Required|	string|	The ID of the entry you’re updating.|
|slug|	Required|	string|	The slug for the flow you are requesting an entry for.|

#### POST - Create an Entry

```url
https://api.moltin.com/v2/flows/:slug/entries
```

**Path Parameters:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|slug|	Required|	string|	The slug for the Flow you are requesting an Entry for.|

**Body:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|type|	Required|	string|	This is always entry.|
|:fieldSlug|	Required| string|	The field slug for each field on this flow along with the corresponding value for this entry.|

#### PUT - Update a Entry

```url
https://api.moltin.com/v2/flows/:slug/entries/:id
```

**Path Parameters:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|slug|	Required|	string|	The slug for the Flow you are requesting an Entry for.|
|id|	Required|	string|	The ID of the entry you are updating.|

**Body:**

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|type|	Required|	string|	This is always entry.|
|:fieldSlug|	Required| string|	The field slug for each field on this flow along with the corresponding value for this entry.|
|entryID| Required| string| The ID of the entry|

#### DELETE - Delete an Entry

```url
https://api.moltin.com/v2/flows/:slug/entries/:id
```

|Name|	Required|	Type|	Description|
|--------|----------|----------|----------|
|slug|	Required|	string|	The slug for the Flow you are requesting an Entry for.|
|id|	Required|	string|	The ID of the entry you are updating.|

## Create an Entry in the Custom Flow (Wishlist)

With the custom Flow configured, next you will create an empty wishlist Entry and then add product IDs to it.

### Create an Empty Wishlist (Flow Entry)

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Open the `Create an entry` request.
* Replace the contents in the body section with:

<pre class="file" data-filename="epcc-flows.json" data-target="insert" data-marker="#ENTRY-BODY">
{\"data\": {\"type\": \"entry\"}}
</pre>

* Send the request to create an empty entry and return the entry ID to be saved in `entryID` environment variable by the test script.

`newman run epcc-flows.json --folder "Create an entry" -e environment.json --export-environment environment.json`{{execute}}

