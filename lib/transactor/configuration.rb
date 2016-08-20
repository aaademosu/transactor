module Transactor
	class Configuration
		attr_accessor :mongo_server

		attr_accessor :database

		attr_accessor :auth_source

		attr_accessor :user

		attr_accessor :password


		def initialize
			@mongo_server = 'localhost:27017'
			@database = 'payment_tokens'
			@auth_source = 'admin'
			@user = 'admin'
			@password = 'ipnxhq'
		end
  	end


	def self.configure
		yield(configuration)
	end

	def self.configuration
		@configuration ||= Configuration.new
	end

	# Set Transactor's configuration
	# @param config [Transactor::Configuration]
	def self.configuration=(config)
		@configuration = config
	end
end
