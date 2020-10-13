class CreateDrops < ActiveRecord::Migration[5.2]
  def change
    create_table :drops do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
