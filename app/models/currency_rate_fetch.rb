# frozen_string_literal: true

# == Schema Information
#
# Table name: currency_rate_fetches
#
#  id                      :bigint           not null, primary key
#  actual                  :boolean          default(FALSE), not null
#  datetime_at             :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  currency_rate_source_id :bigint           not null
#
# Indexes
#
#  index_currency_rate_fetches_on_currency_rate_source_id  (currency_rate_source_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_rate_source_id => currency_rate_sources.id)
#
class CurrencyRateFetch < ApplicationRecord
  belongs_to :currency_rate_source
end
