class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.integer :author
      t.integer :ilustrator
      t.integer :photographer
      t.integer :totalpages
      t.string :format
      t.integer :editor
      t.integer :editionyear
      t.string :editora
      t.string :isbn
      t.string :binding
      t.string :realisation
      t.integer :designer
      t.string :correction
      t.string :clasification
      t.string :content
      t.string :banner
      t.string :troquelado
      t.string :collection

      t.timestamps null: false
    end
  end
end
