# frozen_string_literal: true

# == Schema Information
#
# Table name: currency_rates
#
#  id                     :bigint           not null, primary key
#  manual_value           :decimal(, )
#  nominal                :integer
#  value                  :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  currency_id            :bigint           not null
#  currency_rate_fetch_id :bigint           not null
#
# Indexes
#
#  index_currency_rates_on_currency_id             (currency_id)
#  index_currency_rates_on_currency_rate_fetch_id  (currency_rate_fetch_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (currency_rate_fetch_id => currency_rate_fetches.id)
#
require 'rails_helper'

RSpec.describe CurrencyRate do
  pending "add some examples to (or delete) #{__FILE__}"
end
