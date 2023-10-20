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
require 'rails_helper'

RSpec.describe CurrencyForceRate do
  pending "add some examples to (or delete) #{__FILE__}"
end
