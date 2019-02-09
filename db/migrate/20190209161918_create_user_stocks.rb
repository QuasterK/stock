class CreateUserStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stocks do |t|
      t.references :user, foreign_key: true
      t.references :market, foreign_key: true

      t.timestamps
    end
  end
end
