class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encypted_password, null: false, default: ""
      t.text :description
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
