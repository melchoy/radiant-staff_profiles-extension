module NavigationHelpers
  
  # Extend the standard PathMatchers with your own paths
  # to be used in your features.
  # 
  # The keys and values here may be used in your standard web steps
  # Using:
  #
  #   When I go to the "staff_profiles" admin page
  # 
  # would direct the request to the path you provide in the value:
  # 
  #   admin_staff_profiles_path
  # 
  PathMatchers = {} unless defined?(PathMatchers)
  PathMatchers.merge!({
    # /staff_profiles/i => 'admin_staff_profiles_path'
  })
  
end

World(NavigationHelpers)