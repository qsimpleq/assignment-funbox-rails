# frozen_string_literal: true

class CreateCurrencyRates < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_rates do |t|
      t.decimal :value
      t.integer :nominal
      t.references :currency, null: false, foreign_key: true
      t.references :currency_rate_fetch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
