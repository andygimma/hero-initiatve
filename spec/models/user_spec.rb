require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  
  describe "model attributes" do
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:password) }
    it { expect(user).to respond_to(:password_confirmation) }
    
    it { expect(user).to have_many(:locations) }
    it { expect(user).to have_many(:workshops) }


  end
end
