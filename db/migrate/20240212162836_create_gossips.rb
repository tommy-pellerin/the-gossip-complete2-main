class CreateGossips < ActiveRecord::Migration[7.1]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users
      t.timestamps
    end
  end
end
