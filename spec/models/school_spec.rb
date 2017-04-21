require 'rails_helper'

describe School do
  let!(:school) { create(:school, website: 'me.com') }

  describe 'brief must be maximum of 150 characters' do
    it do
      expect(School.last.website).to eq('http://me.com')
    end
  end
end
