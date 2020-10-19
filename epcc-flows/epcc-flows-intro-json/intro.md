## Create a Wishlist with Flows

In these exercises, you will learn about Flows and how to use Flows to extend and customize the data schema. You will be using the example scenario wherein you will create a *wishlist* resource and extend the *customer* resource to associate it with the *wishlist* resource.

### Prerequisites

You need to have the following tools installed:

* Newman (free version of Postman CLI)
* Elastic Path Commerce Cloud account that you can use for this training

### Objectives

* Introduction to Flows (custom data)
* Understand resource structure
* Learn about core vs non-core Flows
* Create a Flow for your wishlist object.
* Create products Field to store customer's desired products.
* Create empty Entries to associate with products.
* Create a relationship between an Entry and a product. This will be created every time a customer adds a product to a wishlist.
* Associate a wishlist with a customer by adding a customers Flow and creating a one-to-many relationship between a customer and a wishlist.

### Load API collection in Postman

You will be sending the API requests with Newman to complete the exercises, your API collection is loaded in the editor in a *collection.json* file along with the environment file *environment.json*.