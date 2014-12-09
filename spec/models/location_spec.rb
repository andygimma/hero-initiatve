require 'spec_helper'

describe Location do
  let(:location) { FactoryGirl.build(:location) }

  describe "model attributes" do
    it { expect(location).to respond_to(:name) }
    it { expect(location).to respond_to(:address) }
    it { expect(location).to respond_to(:city) }
    it { expect(location).to respond_to(:state) }
    it { expect(location).to respond_to(:phone1) }
    it { expect(location).to respond_to(:email) }
    it { expect(location).to respond_to(:latitude) }
    it { expect(location).to respond_to(:longitude) }
    
    it { expect(location).to have_many(:workshops) }
    it { expect(location).to belong_to(:user) }

  end
end
