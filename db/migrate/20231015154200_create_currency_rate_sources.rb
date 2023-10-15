# frozen_string_literal: true

class CreateCurrencyRateSources < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_rate_sources do |t|
      t.string :name
      t.string :url
      t.references :base_currency, foreign_key: { to_table: :currencies }

      t.timestamps
    end
    add_index :currency_rate_sources, :name, unique: true
    add_index :currency_rate_sources, :url, unique: true
  end
end
