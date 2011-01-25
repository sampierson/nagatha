require 'spec_helper'

describe User do
  fixtures :users
  
  describe "#admin" do
    it "should return true if the user is a confirmed admin user, false otherwise" do
      users(:confirmed_admin_user).should be_admin
      users(:unconfirmed_admin_user).should_not be_admin
      users(:locked_admin_user).should_not be_admin
      users(:unconfirmed_user).should_not be_admin
      users(:unconfirmed_user).should_not be_admin
      users(:locked_user).should_not be_admin
    end
  end

end
