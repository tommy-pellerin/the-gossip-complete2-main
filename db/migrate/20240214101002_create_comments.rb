class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users
      t.belongs_to :gossip, index: true #cette ligne rajoute la référence à la table gossip
      t.timestamps
    end
  end
end
