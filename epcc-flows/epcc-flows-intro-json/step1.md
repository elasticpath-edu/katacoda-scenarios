## Custom Data (Flows)

Flows allow you to extend an existing or create a new resource.

### Core vs. non-core Flow

The table below describes main differences between core and non-core Flows.

|Core Flows|	Non-core Flows|
|------------|-----------------|
|Extend an existing resource.|	Create a new resource.|
|Entries managed automatically by Commerce Cloud.|	Need to manually create and manage Entries.|
|Requests are sent to the Fields endpoint.|	Requests are sent to the Entries endpoint.|

### Extend a resource

Extending a resource applies only to core flows. When creating a new flow, make sure the slug matches that of a core resource. For example, *address* object can be extended by creating a flow with slug as *addresses*.

### Add a new resource

Adding a new resource is applicable only to non-core (custom) flows.

### Resource structure

**A Flow** describes a collection of Fields. It is named after the internal entity type you want to associate it with. For example, a Flow with a slug of products applies to all product responses in your store.

**A Field** represents a single field of data (for example a Product Rating) to be applied to an entity. All Fields have a type (string, integer, boolean, date or relationship), a default value, and an optional set of validation rules.

**An Entry** is a specific instance of a Flow, and is associated with a specific instance of an entity (for example, a single product). Use Entries for custom flows (non-core) only. For core flows, these are managed for you.

## Flows API

### The flow object

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

### The field object

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

### Entries

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

### Entry Relationships

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
