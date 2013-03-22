class AddPositionExtraOption < ActiveRecord::Migration
  def self.up
    add_column :staff_profiles, :position_extra, :string
  end

  def self.down
    remove_column :staff_profiles, :position_extra
  end
end
