class AddDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :date, :date
  end
end
