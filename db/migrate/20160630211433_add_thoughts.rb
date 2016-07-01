class AddThoughts < ActiveRecord::Migration
  def change

    create_table :thoughts do |t|
      t.string :body
      t.integer :user_id
      t.string  :photo_tag
      t.timestamps
    end
  end
end
