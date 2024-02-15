class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email
      t.integer :age
      t.belongs_to :city, index: true #cette ligne rajoute la référence à la table cities
      t.timestamps
    end
  end
end
