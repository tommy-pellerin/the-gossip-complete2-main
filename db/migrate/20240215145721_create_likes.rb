class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.boolean :content
      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users
      t.belongs_to :gossip, index: true #cette ligne rajoute la référence à la table gossip
      t.timestamps
    end
  end
end
