class CreateBeds < ActiveRecord::Migration[7.0]
  def change
    create_table :beds do |t|
      t.integer :bed_size
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
