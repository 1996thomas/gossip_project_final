class CreateCommentaries < ActiveRecord::Migration[7.0]
  def change
    create_table :commentaries do |t|
      t.string :content
      t.belongs_to :user
      t.belongs_to :gossip
      t.timestamps
    end
  end
end
