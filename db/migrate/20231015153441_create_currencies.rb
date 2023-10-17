# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :num_code
      t.string :char_code

      t.timestamps
    end
    add_index :currencies, :num_code, unique: true
    add_index :currencies, :char_code, unique: true
  end
end
