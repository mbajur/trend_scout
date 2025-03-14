class CreateTrendScoutAlerts < ActiveRecord::Migration[8.0]
  def change
    create_table :trend_scout_alerts do |t|
      t.references :scout, null: false, foreign_key: { to_table: :trend_scout_scouts }
      t.decimal :before_value, precision: 10, scale: 2
      t.decimal :after_value, precision: 10, scale: 2
      t.datetime :seen_at

      t.timestamps
    end
  end
end
