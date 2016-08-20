module Transactor
  class TransactionsController < ApplicationController
    def index
      respond_to do |format|
        format.json { render json: JSON.pretty_generate(Transactor::Transaction.all()) }
        format.html {}
      end
    end
  end
end
