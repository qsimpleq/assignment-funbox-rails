# frozen_string_literal: true

class CreateCurrencyRateFetches < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_rate_fetches do |t|
      t.references :currency_rate_source, null: false, foreign_key: true
      t.boolean :actual, null: false, default: false
      t.datetime :datetime_at

      t.timestamps
    end
  end
end
