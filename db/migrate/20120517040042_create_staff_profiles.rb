class CreateStaffProfiles < ActiveRecord::Migration
  def self.up
    unless ActiveRecord::Base.connection.tables.include?('staff_profiles')
      create_table :staff_profiles do |t|
        t.string :firstname
        t.string :lastname
        t.string :position
        t.string :mobile
        t.string :email
        t.string :website
        t.integer  :created_by_id
        t.integer  :updated_by_id
        t.integer  :lock_version, :default => 0
        t.timestamps
      end
    end
  end

  def self.down
    drop_table :staff_profiles
  end
end
