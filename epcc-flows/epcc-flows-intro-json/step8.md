With core Flow created, you'll next create an Entry. Start with an empty Entry and then associate wishlists to it.

### Create a Relationship Entry

With the new field `wishlists` in `customers` Flow, create a new relationship entry to associate the wishlist to the customer:

* Open the collection from `collection.json`{{open}} in the editor
* Replace the contents in the body section of the `Create a customer entry relationship` request with the following:
> Remove any extra line breaks inserted in the raw data above.

<pre class="file" data-filename="collection.json" data-target="insert" data-marker="#ENTRY-REL-CUST-BODY">
{\"data\": [{\"type\": \"wishlists\",\"id\": \"{{entryID}}\"}]}
</pre>

* Send the request to create a new entry relationship connecting the customer to the wishlist.

`newman run collection.json --folder "Create a customer entry relationship" -e environment.json`{{execute}}