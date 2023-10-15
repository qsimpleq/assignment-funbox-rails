# frozen_string_literal: true

# == Schema Information
#
# Table name: currencies
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_currencies_on_code  (code) UNIQUE
#  index_currencies_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Currency do
  pending "add some examples to (or delete) #{__FILE__}"
end
