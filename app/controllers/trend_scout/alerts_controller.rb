module TrendScout
  class AlertsController < ApplicationController
    after_action :mark_all_as_seen, only: [:index]

    def index
      @unread_alerts = Alert.where(seen_at: nil).order(id: :desc).limit(25)
      @read_alerts = Alert.where.not(seen_at: nil).order(id: :desc).limit(100)
    end

    private

    def mark_all_as_seen
      @unread_alerts.touch_all(:seen_at) if @unread_alerts.any?
    end
  end
end
