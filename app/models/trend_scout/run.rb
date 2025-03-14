module TrendScout
  class Run < ApplicationRecord
    belongs_to :scout

    enum status: {
      success: 'success',
      failure: 'failure'
    }
  end
end
