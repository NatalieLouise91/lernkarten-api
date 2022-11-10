class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :word
      t.text :definition
      t.string :gender
      t.text :sentence
      t.timestamps
    end
  end
end
