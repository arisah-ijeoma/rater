require 'rails_helper'

describe ProfilesController do
  let(:user) { build(:user) }

  before do
    user.save
  end

  describe 'POST #create' do
    it 'profile is created on user creation' do
      expect(Profile.count).to eq(1)
    end
  end
end
