# transactor

TODO: gem description

## Installation

Add this line to your application's Gemfile:

    gem 'transactor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transactor

## Usage

Modify Transactor's current configuration
@yieldparam [Transactor::Configuration] config current Transactor config
```
Transactor.configure do |config|
  config.mongo_server 	= '192.168.1.1'
  config.database 		= 'database_name'
  config.auth_source 	= 'admin'
  config.user 			= 'user'
  config.password 		= 'password'
end
``
