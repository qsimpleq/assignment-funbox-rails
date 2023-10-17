# frozen_string_literal: true

module FetchCurrencyRateService
  class CbrDailyByRub
    extend FetchCurrencyRateService::Builder
    include FetchCurrencyRateService::Base

    NAME = 'cbr-xml-daily.ru'
    URL = 'https://www.cbr-xml-daily.ru/daily_json.js'
    BASE_CURRENCY = {
      num_code: '643',
      char_code: 'RUB',
      name: 'Российский рубль'
    }.freeze

    def response_processing
      parsed = JSON.parse(@response.body, symbolize_names: true)

      {
        base_currency: @base_currency[:char_code],
        datetime_at: parsed[:Date],
        currencies: parsed[:Valute].map do |_, currency|
          {
            char_code: currency[:CharCode],
            num_code: currency[:NumCode],
            nominal: currency[:Nominal],
            name: currency[:Name],
            value: currency[:Value]
          }
        end
      }
    rescue JSON::ParserError => e
      @errors << e.message
      Rails.logger.error(e.message)
      []
    end
  end
end
