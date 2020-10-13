class Store < ApplicationRecord
    has_many :transactions, dependent: :destroy
end
