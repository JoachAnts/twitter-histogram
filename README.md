# Twitter Histogram Setup

This installation guide describes how to setup the program on a Debian-based OS

In terms of shortcuts made, I would say that using high level libraries such as the sinatra and twitter gems were chosen to avoid large amounts of code and dealing with the low level details of authorization

## Dependencies

The program requires the following dependencies:

1. Ruby: `sudo apt-get install ruby`
2. Ruby-dev: `sudo apt-get install ruby-dev`
3. Sinatra: `sudo gem install sinatra`
4. twitter gem: `sudo gem install twitter`
5. dotenv gem: `sudo gem install dotenv`

## Environment Variables

Create a file named 'api_keys.env' and provide values for the following environment variables:

```
CONSUMER_KEY=""
CONSUMER_SECRET=""
ACCESS_TOKEN=""
ACCESS_TOKEN_SECRET=""
```

## Usage

1. Start server: `ruby app.rb`
2. Make a request, either in a browser or using curl:
	* `http://localhost:4567/hello/:name`
	* `http://localhost:4567/histogram/:name`
	
## Testing

To run the tests:

1. Install rack-test: `sudo gem install rack-test`
2. Run: `ruby test.rb`