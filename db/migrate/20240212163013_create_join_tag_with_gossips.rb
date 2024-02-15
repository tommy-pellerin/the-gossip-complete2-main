class CreateJoinTagWithGossips < ActiveRecord::Migration[7.1]
  def change
    create_table :join_tag_with_gossips do |t|
      t.belongs_to :gossip, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
