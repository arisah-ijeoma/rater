require 'rails_helper'

describe PastorsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:church) { create(:church) }
  let(:pastor) { create(:pastor, church_id: church.id) }

  context 'admin' do
    before { sign_in admin }
    describe 'POST create' do
      context 'with valid attributes' do
        it 'admin creates a new pastor' do
          expect{
            post :create, church_id: church, pastor: attributes_for(:pastor)
          }.to change(Pastor, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new pastor' do
          expect{
            post :create, church_id: church, pastor: attributes_for(:invalid_pastor)
          }.to_not change(Pastor, :count)
        end
      end

      describe 'PUT update' do
        context 'valid attributes' do
          it 'located the requested pastor' do
            put :update, id: pastor, church_id: church, pastor: attributes_for(:pastor)
            expect(assigns(:pastor)).to eq(pastor)
          end

          it 'changes pastor\'s attributes' do
            put :update, id: pastor, church_id: church, pastor: attributes_for(:pastor, name: 'Emma')
            pastor.reload
            expect(pastor.name).to eq('Emma')
          end

          it 'redirects to the updated pastor' do
            put :update, id: pastor, church_id: church, pastor: attributes_for(:pastor)
            expect(response).to redirect_to(church_path(church))
          end
        end

        context 'invalid attributes' do
          it 'locates the requested pastor' do
            put :update, id: pastor, church_id: church, pastor: attributes_for(:invalid_pastor)
            expect(assigns(:pastor)).to eq(pastor)
          end

          it 'does not change pastor\'s attributes' do
            put :update, id: pastor, church_id: church, pastor: attributes_for(:invalid_pastor, name: '')
            pastor.reload
            expect(pastor.name).not_to eq('')
            expect(pastor.name).to eq('E.A. Adeboye')
          end
        end
      end
    end
  end
end
