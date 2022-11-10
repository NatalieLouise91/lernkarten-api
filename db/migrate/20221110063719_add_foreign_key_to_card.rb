class AddForeignKeyToCard < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cards, :users
  end
end
