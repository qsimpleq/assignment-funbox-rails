# frozen_string_literal: true

class CurrencyRatesController < ApplicationController
  def index
    @rates = CurrencyRate
             .includes(:currency, :currency_force_rate, { currency_rate_fetch: [:currency_rate_source] })
             .where('currency_rate_fetch.actual': true) # , 'currencies.char_code': 'USD'
             .order('currency_rate_sources.name': :asc, 'currencies.char_code': :asc)
             .limit(15)
  end
end
