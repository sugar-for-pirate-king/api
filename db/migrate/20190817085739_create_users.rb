class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.string :email
      t.text :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
