module Transactor
  class Transaction
    attr_reader :client, :options
    # Initialize the Transaction!
    #
    # Example:
    # values = {
    #   package_number: 60,
    #   customer_number: 25000000025,
    #   transaction_date: "2015-08-25",
    #   product_id: 101,
    #   pay_item_id: 4220,
    #   amount: 2500 * 100,
    #   cust_id: 25000000025,
    #   cust_name: "Ayodele Ademosu"
    # }
    #   >> Transactor::Transaction.new(values)
    #   => Token Object
    #
    # Arguments:
    #   options: (Hash)

    def initialize(args)
      @client = Transactor.store()
      @options = args
    end

    # Class method for locating a Transaction!
    #
    # Example:
    #   >> Transactor::Token.find("RTASAS545789")
    #   => {
    #   package_number: 60,
    #   customer_number: 25000000025,
    #   transaction_date: "2015-08-25",
    #   product_id: 101,
    #   pay_item_id: 4220,
    #   amount: 2500 * 100,
    #   cust_id: 25000000025,
    #   cust_name: "Ayodele Ademosu",
    #   transaction_reference: "RTASAS545789"
    # }
    #
    # Arguments:
    #   transaction_reference: (String)

    def self.find(ref)
      client = Transactor.store()
      obj = client[:tokens].find(:transaction_reference => ref)
      begin
        # p obj.to_a[0]; puts; puts; puts; puts; puts; puts; puts; puts; puts; puts; puts; puts; puts; puts; puts
        obj.to_a[0]
      rescue Exception => e
        # # notify admin
        # puts;puts; p e; puts; puts; puts; puts; puts; puts; puts; puts;puts; puts
        {}
      end
    end

    # Instance method for creating the Transaction!
    #
    # Example:
    #   >> t = Transactor::Transaction.new(hash_options)
    #   >> t.create()
    #   => {
    #   package_number: 60,
    #   customer_number: 25000000025,
    #   transaction_date: "2015-08-25",
    #   product_id: 101,
    #   pay_item_id: 4220,
    #   amount: 2500 * 100,
    #   cust_id: 25000000025,
    #   cust_name: "Ayodele Ademosu",
    #   transaction_reference: "RTASAS545789"
    # }
    # 
    def create
      begin
        options['transaction_reference'] = SecureRandom.hex(8).upcase
        result = client[:tokens].insert_one(options)
        obj = client[:tokens].find(:transaction_reference => options['transaction_reference'])
        obj.to_a[0]
      rescue Exception => e
        raise e
        {}
      end
    end

    def self.update(ref, params)
        client = Transactor.store()
        doc = client[:tokens].find(:transaction_reference => ref).find_one_and_update('$set' => params)
    end

    def self.all
      r = []
      client = Transactor.store()
      client[:tokens].find().each do |doc|
        r << doc
      end
      r
    end
  end
end
