# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
    add_index :currencies, :name, unique: true
    add_index :currencies, :code, unique: true
  end
end
