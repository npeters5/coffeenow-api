class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :api_token

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :api_token, unique: true
  end
end
