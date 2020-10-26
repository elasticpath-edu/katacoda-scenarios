With core Flow created, you'll next create an Entry. Start with an empty Entry and then associate wishlists to it.

### Create a Relationship Entry

With the new field `wishlists` in `customers` Flow, create a new relationship entry to associate the wishlist to the customer:

* Open the collection in the editor:

`/root/epcc-flows.json`{{open}}

* Open the `Create a customer entry relationship` request.
* Replace the contents in the body section with:

<pre class="file" data-filename="epcc-flows.json" data-target="insert" data-marker="#ENTRY-REL-CUST-BODY">
{\"data\": [{\"type\": \"wishlists\",\"id\": \"{{entryID}}\"}]}
</pre>

* Send the request to create a new entry relationship connecting the customer to the wishlist.

`newman run epcc-flows.json --folder "Create a customer entry relationship" -e environment.json`{{execute}}