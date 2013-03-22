class AddTwitterAndFacebookStaffFields < ActiveRecord::Migration
  def self.up
    StaffProfile.reset_column_information
    add_column :staff_profiles, :twitter_username, :string unless StaffProfile.column_names.include?('twitter_username')
    add_column :staff_profiles, :facebook_url, :string unless StaffProfile.column_names.include?('facebook_url')
  end

  def self.down  
    remove_column :staff_profiles, :url
    remove_column :staff_profiles, :url
  end
end
