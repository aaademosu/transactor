Transactor::Engine.routes.draw do
  root :to => 'transactions#index', defaults: { format: 'json' }
end
