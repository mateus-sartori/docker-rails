class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.integer :email_confirmed, null: false, default: 0
      t.timestamp :email_confirmed_at
      t.string :name, null: false
      t.string :verification_code
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
