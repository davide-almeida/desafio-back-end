class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :value_cents
      t.string :cpf_number
      t.string :card_number
      t.references :store, foreign_key: true
      t.references :transaction_rule, foreign_key: true

      t.timestamps
    end
  end
end
