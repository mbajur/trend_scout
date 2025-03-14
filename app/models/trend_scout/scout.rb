module TrendScout
  class Scout < ApplicationRecord
    TYPES = [
      TrendScout::Scouts::ProductPriceFromJsonLd.name
    ]

    has_many :runs, dependent: :destroy

    store :properties, coder: JSON

    validates :name, presence: true
    validates :type, presence: true, inclusion: { in: TYPES }

    after_commit :create_alert_if_last_value_changed, on: :update

    def enqueue
      Scouts::RunJob.perform_later(self)
    end

    private

    def create_alert_if_last_value_changed
      pp saved_change_to_last_value?
      return unless saved_change_to_last_value?

      Alert.create(
        scout: self,
        before_value: last_value_before_last_save,
        after_value: last_value
      )
    end
  end
end
