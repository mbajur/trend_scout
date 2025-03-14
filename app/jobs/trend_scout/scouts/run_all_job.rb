module TrendScout
  module Scouts
    class RunAllJob < ApplicationJob
      def perform
        TrendScout::Scout.where(active: true).find_each.with_index do |scout, index|
          TrendScout::Scouts::RunJob.set(wait: index.minute).perform_later(scout)
        end
      end
    end
  end
end
