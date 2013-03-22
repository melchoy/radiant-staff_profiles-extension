class Admin::StaffProfilesController < Admin::ResourceController
  paginate_models
  
  def index
    @staff_profiles = StaffProfile.by_position    
  end

end