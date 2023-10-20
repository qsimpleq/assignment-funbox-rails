# frozen_string_literal: true

class CreateCurrencyForceRates < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_force_rates do |t|
      t.decimal :value
      t.datetime :expired_at, null: false
      t.references :currency_rate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
