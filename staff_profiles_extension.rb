# Uncomment this if you reference any of your controllers in activate
# require_dependency "application_controller"
require "radiant-staff_profiles-extension"

class StaffProfilesExtension < Radiant::Extension
  version     RadiantStaffProfilesExtension::VERSION
  description RadiantStaffProfilesExtension::DESCRIPTION
  url         RadiantStaffProfilesExtension::URL

  # See your config/routes.rb file in this extension to define custom routes

  extension_config do |config|
    # config is the Radiant.configuration object
  end

  def activate    
    admin.configuration.show.add :config, 'admin/configuration/staff_profiles_show', :before => 'defaults'
    admin.configuration.edit.add :form,   'admin/configuration/staff_profiles_edit', :before => 'edit_defaults'
      
    Page.send :include, StaffProfileTags
  
    tab 'Content' do
      add_item "Staff", "/admin/staff_profiles", :after => "Pages"
    end
  end
end
