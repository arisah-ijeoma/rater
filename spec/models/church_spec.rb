require 'rails_helper'

describe Church do
  let!(:church) { create(:church, website: 'me.com') }

  describe 'brief must be maximum of 150 characters' do
    it do
      expect(Church.last.website).to eq('http://me.com')
    end
  end
end
