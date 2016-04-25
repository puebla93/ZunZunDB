class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.integer :number
      t.string :month
      t.integer :year
      t.integer :cd
      t.string :issn

      t.timestamps null: false
    end
  end
end
