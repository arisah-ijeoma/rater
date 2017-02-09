require 'rails_helper'

describe Profile do
  describe 'profile is created when user is created' do
    it do
      user = create(:user)
      expect(user.profile).to be_truthy
    end
  end

  describe 'brief must be maximum of 150 characters' do
    it do
      expect{
        create(:invalid_brief)
      }.to raise_error('Validation failed: Brief 150 characters is the maximum allowed')
    end
  end
end
