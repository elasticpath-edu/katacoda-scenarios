### Set up the Training Environment

You will be using the API key from your training store to create a new environment in Postman.
>You can request a training store by following the instructions from the [Request a Training Store](https://elasticpath-customer.okta.com/app/litmos/exknrryohFKR6waw9356/sso/saml?RelayState=http://education.elasticpath.com/course/1913632) module.

* Go to https://dashboard.elasticpath.com/ and make note of your `Client ID` and `Client secret`.
* Open the environment file:

`/root/environment.json`{{open}}

* Update environment variables named `clientID` and `clientSecret` using the values from the previous step.

As you progress through the collection, additional variables will be created and used from request to request. You can confirm the value of any variable's current value from the environment settings.