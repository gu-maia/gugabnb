class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :source
      t.text :request_body
      t.integer :status
      t.string :event_type

      t.timestamps
    end
  end
end
