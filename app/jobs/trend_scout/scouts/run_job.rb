module TrendScout
  module Scouts
    class RunJob < ApplicationJob
      def perform(scout)
        scout_run = scout.runs.new

        begin
          result = scout.perform
          scout_run.value = result
          scout_run.status = 'success'
        rescue StandardError => e
          Rails.error.report(e)
          scout_run.error_message = e.message
          scout_run.status = 'failure'
        ensure
          scout_run.save!
          scout.update!(
            last_run_at: Time.current,
            last_status: scout_run.status,
            last_value: scout_run.value
          )
        end
      end
    end
  end
end
