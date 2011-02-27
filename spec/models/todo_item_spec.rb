require 'spec_helper'

describe TodoItem do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user_id, :message => /must.*supplied/) }
  end
end
