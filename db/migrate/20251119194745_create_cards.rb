class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.decimal :value, precision: 12, scale: 2, default: 0
      t.integer :position, default: 0
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
