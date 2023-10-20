# frozen_string_literal: true

# == Schema Information
#
# Table name: currency_force_rates
#
#  id               :bigint           not null, primary key
#  expired_at       :datetime         not null
#  value            :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  currency_rate_id :bigint           not null
#
# Indexes
#
#  index_currency_force_rates_on_currency_rate_id  (currency_rate_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_rate_id => currency_rates.id)
#
class CurrencyForceRate < ApplicationRecord
  belongs_to :currency_rate, inverse_of: :currency_force_rates
end
