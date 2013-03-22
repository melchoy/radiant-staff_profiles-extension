module StaffProfileTags
  include Radiant::Taggable
  
  include ActionView::Helpers::UrlHelper
  include ActionController::UrlWriter
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::TextHelper
  
  desc %{ }
  tag 'staff_profiles' do |tag|
    tag.locals.staff_profiles = StaffProfile.by_position
    tag.expand
  end

  desc %{ }
  tag 'staff_profiles:each' do |tag|
    result = []

    displayed_entries = StaffProfile.by_position

    displayed_entries.each_with_index do |item, i|
      tag.locals.staff_profile = item
      tag.locals.first_child = i == 0
      tag.locals.last_child = i == tag.locals.staff_profiles.length - 1
      result << tag.expand
    end

    result
  end

  desc %{ }
  tag 'staff_profile' do |tag|
    tag.expand
  end

  desc %{ }
  tag 'staff_profile:fullname' do |tag|
    tag.locals.staff_profile.fullname
  end

  desc %{ }
  tag 'staff_profile:firstname' do |tag|
    tag.locals.staff_profile.firstname
  end

  desc %{ }
  tag 'staff_profile:lastname' do |tag|
    tag.locals.staff_profile.lastname
  end

  desc %{ }
  tag 'staff_profile:position' do |tag|
    tag.locals.staff_profile.display_position
  end

  desc %{ }
  tag 'staff_profile:mobile' do |tag|
    tag.locals.staff_profile.mobile
  end

  desc %{ }
  tag 'staff_profile:email' do |tag|
    tag.locals.staff_profile.email
  end

  desc %{ }
  tag 'staff_profile:twitter_username' do |tag|
    tag.locals.staff_profile.twitter_username
  end

  desc %{ }
  tag 'staff_profile:if_twitter_username' do |tag|
    tag.expand unless tag.locals.staff_profile.twitter_username.empty? || tag.locals.staff_profile.twitter_username.nil?
  end

  desc %{ }
  tag 'staff_profile:unless_twitter_username' do |tag|
    tag.expand if tag.locals.staff_profile.twitter_username.empty? || tag.locals.staff_profile.twitter_username.nil?
  end

  desc %{ }
  tag 'staff_profile:facebook_url' do |tag|
    tag.locals.staff_profile.facebook_url
  end

  desc %{ }
  tag 'staff_profile:if_facebook_url' do |tag|
    tag.expand unless tag.locals.staff_profile.facebook_url.empty? || tag.locals.staff_profile.facebook_url.nil?
  end

  desc %{ }
  tag 'staff_profile:unless_facebook_url' do |tag|
    tag.expand if tag.locals.staff_profile.facebook_url.empty? || tag.locals.staff_profile.facebook_url.nil?
  end

  desc %{ }
  tag 'staff_profile:website' do |tag|
    tag.locals.staff_profile.website
  end

  desc %{ }
  tag 'staff_profile:if_website' do |tag|
    tag.expand unless tag.locals.staff_profile.website.empty? || tag.locals.staff_profile.website.nil?
  end

  desc %{ }
  tag 'staff_profile:unless_website' do |tag|
    tag.expand if tag.locals.staff_profile.website.empty? || tag.locals.staff_profile.website.nil?
  end

  desc %{ }
  tag 'staff_profile:avatar' do |tag|
    image_tag tag.locals.staff_profile.staff_avatar.url, :class => 'avatar', :alt => tag.locals.staff_profile.fullname
  end

  desc %{ }
  tag "staff_profile:avatar_path" do |tag| 
  end
  
end