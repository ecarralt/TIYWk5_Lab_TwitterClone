class AddUsersBis < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string "password_digest"
      t.string :blurb
      t.string :photo_tag,  default:"http://www.resourcesgraphics.com/wp-content/uploads/2013/05/dark-side-profile-hooded-vector-avatar-.jpg"
      t.timestamps
    end
  end
end
