# frozen_string_literal: true

# == Schema Information
#
# Table name: currency_rate_sources
#
#  id               :bigint           not null, primary key
#  name             :string
#  url              :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  base_currency_id :bigint
#
# Indexes
#
#  index_currency_rate_sources_on_base_currency_id           (base_currency_id)
#  index_currency_rate_sources_on_name_and_base_currency_id  (name,base_currency_id) UNIQUE
#  index_currency_rate_sources_on_url                        (url) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (base_currency_id => currencies.id)
#
class CurrencyRateSource < ApplicationRecord
  belongs_to :currency, foreign_key: 'base_currency_id', inverse_of: :currency_rate_sources
  has_many :currency_rate_fetches, dependent: :destroy
end
