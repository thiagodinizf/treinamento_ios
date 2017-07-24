class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :birth_date
      t.string :email
      t.string :phone_number
      t.string :nickname
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
