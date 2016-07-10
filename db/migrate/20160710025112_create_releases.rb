class CreateReleases < ActiveRecord::Migration
  def up
    create_table :releases do |t|
      t.integer :client_id
      t.string :info_types_and_dates
      t.integer :initialed
      t.string :releasee
      t.string :releasee_info
      t.string :purpose
    end

  def down
    drop_table :releases
  end
end
