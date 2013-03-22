require File.dirname(__FILE__) + '/../spec_helper'

describe StaffProfile do
  before(:each) do
    @staff_profile = StaffProfile.new
  end

  it "should be valid" do
    @staff_profile.should be_valid
  end
end
