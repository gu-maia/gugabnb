class AddErrorMessageToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :error_message, :text
  end
end
