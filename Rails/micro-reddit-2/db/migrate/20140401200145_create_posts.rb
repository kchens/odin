class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :comment
      t.references :user, index: true

      t.timestamps
    end
  end
end
