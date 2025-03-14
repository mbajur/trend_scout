class CreateTrendScoutRuns < ActiveRecord::Migration[8.0]
  def change
    create_table :trend_scout_runs do |t|
      t.references :scout, null: false, foreign_key: true
      t.decimal :value, precision: 10, scale: 2
      t.string :status
      t.string :error_message

      t.timestamps
    end
  end
end
