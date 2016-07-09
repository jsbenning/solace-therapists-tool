class CreateClients < ActiveRecord::Migration
   def up
    create_table :clients do |t|
      t.integer :therapist_id
      t.string :medical_record_id
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :address
      t.string :phone
    end
  end
  
  def down
    drop_table :clients
  end
end
