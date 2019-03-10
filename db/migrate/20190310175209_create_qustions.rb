class CreateQustions < ActiveRecord::Migration[5.2]
  def change
    create_table :qustions do |t|
      t.string :text
      t.string :answer

      t.timestamps
    end
  end
end
