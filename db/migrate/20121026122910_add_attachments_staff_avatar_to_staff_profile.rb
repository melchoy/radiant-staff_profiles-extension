class AddAttachmentsStaffAvatarToStaffProfile < ActiveRecord::Migration
  def self.up
    add_column :staff_profiles, :staff_avatar_file_name, :string
    add_column :staff_profiles, :staff_avatar_content_type, :string
    add_column :staff_profiles, :staff_avatar_file_size, :integer
    add_column :staff_profiles, :staff_avatar_updated_at, :datetime
  end

  def self.down
    remove_column :staff_profiles, :staff_avatar_file_name
    remove_column :staff_profiles, :staff_avatar_content_type
    remove_column :staff_profiles, :staff_avatar_file_size
    remove_column :staff_profiles, :staff_avatar_updated_at
  end
end
