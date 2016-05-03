class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :name
      t.string :attachment
      t.string :info

      t.timestamps null: false
    end
  end
end
