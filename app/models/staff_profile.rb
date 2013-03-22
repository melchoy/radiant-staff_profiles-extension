class StaffProfile < ActiveRecord::Base                           
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  
  # Validations
  validates_presence_of :firstname, :lastname, :position, :email
  validates_format_of :email, :allow_nil => true, :with => /^$|^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  has_attached_file :staff_avatar, 
                    :default_style => :normal,
                    :styles => { :normal => "200x200#",
                                 :thumb => "100x100#",
                                 :tiny => "50x50#" },
                     :url => Radiant.config["paperclip.url"],
                     :path => Radiant.config["paperclip.path"]
   
  
  before_validation :clear_staff_avatar

  # Later in the model
  def clear_staff_avatar
   self.staff_avatar = nil if delete_staff_avatar? && !staff_avatar.dirty?
  end
  
  def delete_staff_avatar=(value)
   @delete_staff_avatar = !value.to_i.zero?
  end

  def delete_staff_avatar
   !!@delete_staff_avatar
  end
  alias_method :delete_staff_avatar?, :delete_staff_avatar 
    
  
  def display_position
    self.position.strip == "PA" ? "#{self.position} #{self.position_extra}" : self.position
  end
  
  def fullname
    "#{self.firstname} #{self.lastname}"
  end
  
  def self.available_positions
    Radiant.config['staff_profiles.positions'].split(",")
  end    

  def self.order_by_case
    ret = "CASE"
    self.available_positions.each_with_index do |p, i|
      ret << " WHEN position = '#{p}' THEN #{i}"
    end
    ret << " END"
  end
  named_scope :by_position, :order => order_by_case
  
end
