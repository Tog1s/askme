class AddProfileColorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_color, :string
  end
end
