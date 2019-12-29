class CreateScenarios < ActiveRecord::Migration[6.0]
  def change
    create_table :scenarios do |t|
      t.integer :scenario_no, null:false
      t.text :description, null:false
      t.integer :next_no1, default: 0
      t.integer :next_no2, default: 0
      t.integer :next_no3, default: 0
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
