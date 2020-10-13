class CreateTransactionRules < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_rules do |t|
      t.integer :kind
      t.string :description
      t.string :source
      t.string :operator

      t.timestamps
    end
  end
end
