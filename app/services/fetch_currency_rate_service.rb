# frozen_string_literal: true

module FetchCurrencyRateService
  class Error < StandardError
  end

  module Base
    attr_reader :url, :errors, :result, :base_currency, :currency_rate_source

    # BASE_CURRENCY structure
    # {
    #   num_code: '643',
    #   char_code: 'RUB',
    #   name: 'Российский рубль'
    # }
    BASE_CURRENCY = {}.freeze
    NAME = ''

    def initialize
      @url = self.class::URL
      @errors = []

      # @result structure
      # {
      #   base_currency: 'RUR',
      #   datetime_at: ,
      #   currencies: [
      #     {
      #       num_code: "826",
      #       char_code: "GBP",
      #       nominal: 1,
      #       name: "Фунт стерлингов Соединенного королевства",
      #       value: 118.8514,
      #     }
      #   ]
      # }
      @result = {}

      unless self.class::BASE_CURRENCY.is_a?(Hash)
        raise FetchCurrencyRateService::Error,
              'Wrong BASE_CURRENCY type'
      end
      if self.class::BASE_CURRENCY.keys.empty?
        raise FetchCurrencyRateService::Error,
              'Empty BASE_CURRENCY'
      end
      raise FetchCurrencyRateService::Error, 'Empty NAME' if self.class::NAME.empty?

      @base_currency = find_or_create_currency!(self.class::BASE_CURRENCY)
    end

    def perform
      return false unless rest_response

      @result = response_processing

      ActiveRecord::Base.connection.transaction do
        create_currency_rate_source
        prepare_result_currencies!
        create_update_currency_fetch
        import_currency_rates
      end

      true
    rescue StandardError => e
      @errors << e.message
      Rails.logger.error(e.message)
      false
    end

    private

    def import_currency_rates
      currency_rates = []
      @result[:currencies].each do |currency|
        currency_rates << {
          currency_id: currency[:currency_id],
          currency_rate_fetch_id: @currency_rate_fetch.id,
          manual_value: currency[:manual_value],
          nominal: currency[:nominal],
          value: currency[:value]
        }
      end

      CurrencyRate.import(currency_rates)
    end

    def create_update_currency_fetch
      CurrencyRateFetch.where(currency_rate_source_id: @currency_rate_source.id, actual: true)
                       .update(actual: false)

      @currency_rate_fetch = CurrencyRateFetch.create(
        actual: true,
        currency_rate_source_id: @currency_rate_source.id,
        datetime_at: @result[:datetime_at]
      )
    end

    def create_currency_rate_source
      find = { name: self.class::NAME, base_currency_id: @base_currency.id }
      @currency_rate_source = CurrencyRateSource.find_or_initialize_by(find) do |c|
        c.url = @url
        c.save
      end
    end

    def find_or_create_currency!(currency)
      Currency.find_or_create_by!(char_code: currency[:char_code]) do |r|
        r.num_code = currency[:num_code]
        r.char_code = currency[:char_code]
        r.name = currency[:name]
      end
    end

    def prepare_result_currencies!
      @result[:currencies] = @result[:currencies].map do |currency|
        c = find_or_create_currency!(currency)
        currency[:currency_id] = c.id
        currency
      end
    end

    def rest_response
      @response = Faraday.get(@url)

      if @response.status.to_i != 200
        @errors << "response status: #{@response.status}"

        return
      end

      @response
    end

    def response_processing; end
  end
end
