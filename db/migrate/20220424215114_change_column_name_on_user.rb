class ChangeColumnNameOnUser < ActiveRecord::Migration[5.2]
  def change
        rename_column :users, :apikey, :api_key
  end
end
