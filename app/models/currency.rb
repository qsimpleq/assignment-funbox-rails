# frozen_string_literal: true

# == Schema Information
#
# Table name: currencies
#
#  id         :bigint           not null, primary key
#  char_code  :string
#  name       :string
#  num_code   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_currencies_on_char_code  (char_code) UNIQUE
#  index_currencies_on_num_code   (num_code) UNIQUE
#
class Currency < ApplicationRecord
end
