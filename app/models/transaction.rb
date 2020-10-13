class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :transaction_rule

  # RubyMoney config
  monetize :value_cents

end
