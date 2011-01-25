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

  describe ".search" do
    it "should execute a LIKE query with the supplied argument" do
      User.should_receive(:where).with("email LIKE ?", "%foo%")
      User.search("foo")
    end
  end

end
