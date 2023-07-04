class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.references :operation, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
