# frozen_string_literal: true

class FetchCurrencyRateJob
  include Sidekiq::Job
  queue_as :cron

  def perform
    FetchCurrencyRateService::RunAll.perform
  end
end
