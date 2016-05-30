# SAP Anywhere - Pushing Fake Data

A wrapper around the SAP Anywhere API in Ruby allowing me to populate an environment with fake data quickly.  The primary purpose of this utility is to aide the sales team in having demonstrable data that is current.

## Using the Utility

1. Clone the repository to your local machine.
2. Navigate to your cloned directory and ensure that you have all dependencies installed locally
  rest-client
  json
  pry (optional for debugging - comment it out of fake_anywhere_api.rb if you don't want to install it)
  faker
  as-duration
  
3. You're probably on the command line at this point, but in case you're not - start up a new shell and navigate to the project directory
4. Export your SAP Anywhere private app API variables.  The documentation for creating a private app can be found here: https://doc-us.sapanywhere.com/api/app/private_app
5. The environment variables are SAP_ANW_API_KEY, SAP_ANW_API_SECRET, and SAP_ANW_REFRESH_TOKEN - I keep mine in a file locally and `source my_file` when I want to set them
5. Type `ruby fake_anywhere_api.rb` and hit return.  The utility will start - follow the instructions to push fake records into your instance of Anywhere.

### TO DO

I still haven't gotten the fake payments menu working - there is some issue with the API as of 1604 or I'm incorrectly implementing the record.  In either case, consider fake payments as stubbed out as of this push
