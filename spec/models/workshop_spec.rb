require 'spec_helper'

describe Workshop do
  let(:workshop) { FactoryGirl.build(:workshop) }
  
  describe "model attributes" do
    it { expect(workshop).to respond_to(:title) }
    it { expect(workshop).to respond_to(:context) }
    it { expect(workshop).to respond_to(:location_id) }
    it { expect(workshop).to respond_to(:start_time) }
    it { expect(workshop).to respond_to(:end_time) }
    it { expect(workshop).to respond_to(:start_date) }
    it { expect(workshop).to respond_to(:approved) }
    it { expect(workshop).to respond_to(:user_id) }
    
    it { expect(workshop).to belong_to(:user) }
    it { expect(workshop).to belong_to(:location) }

  end
end
