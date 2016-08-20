module Transactor
  class Engine < ::Rails::Engine
    isolate_namespace Transactor

    initializer 'transactor.initialize' do |app|
      Transactor.start()
    end
  end
end
