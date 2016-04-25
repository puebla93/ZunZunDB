class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :author
      t.integer :ilustrator
      t.integer :photographer
      t.string :gender
      t.string :subject
      t.integer :magazineId
      t.integer :colorist
      t.integer :totalpages
      t.string :pdf
      t.string :thematicdesing
      t.string :original
      t.string :originallocation
      t.string :section

      t.timestamps null: false
    end
  end
end
