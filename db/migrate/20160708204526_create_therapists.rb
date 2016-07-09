class CreateTherapists < ActiveRecord::Migration
  def up
    create_table :therapists do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :license_type
      t.string :license_number
    end
  end

  def down
    drop_table :therapists
  end
end
