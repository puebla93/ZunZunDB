class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :gender
      t.text :description

      t.timestamps null: false
    end
  end
end
