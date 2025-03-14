class CreateTrendScoutScouts < ActiveRecord::Migration[8.0]
  def change
    create_table :trend_scout_scouts do |t|
      t.string :name
      t.text :properties
      t.string :type
      t.boolean :active, default: true
      t.timestamp :last_run_at
      t.string :last_status, precision: 10, scale: 2
      t.decimal :last_value

      t.timestamps
    end
  end
end
