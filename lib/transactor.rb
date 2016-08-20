require "mongo"
require "transactor/configuration"
require "transactor/transaction"

module Transactor
  # # makes use of the connection class so must take same number of arguments has the Connection.new class
  # # http://www.justinweiss.com/blog/2014/12/01/better-globals-with-a-tiny-activesupport-module/

  def self.start()
    # # how can we make this thread safe i.e. i do not want to use instance variables!!!

    begin
      @store = Mongo::Client.new(
        [ Transactor.configuration.mongo_server ],
        :database => Transactor.configuration.database,
        :auth_source => Transactor.configuration.auth_source,
        :user => Transactor.configuration.user,
        :password => Transactor.configuration.password
      )
      
      @store[:tokens].indexes.create_one( { :transaction_reference => 1 }, :unique => true )
    rescue Mongo::Error::NoServerAvailable => e
      raise "\n\n Could not connect to server at. #{Transactor.configuration.mongo_server}. Please ensure the mongod service is running on the server #{Transactor.configuration.mongo_server}. \n\n"
    rescue Mongo::Error::OperationFailure => e
      puts "\n\n\n"; p e; puts "\n\n\n"
      # # Use a notifier that can send emails HERE!!!!
    rescue Exception => e
      raise e
      # nil # # print "index already created!!!"
    end
  end

  def self.store
    return @store if @store
    raise "No connection, start as follows: Transactor.start()"
  end
end

# # start your engines
require "transactor/engine" if defined?(Rails)
