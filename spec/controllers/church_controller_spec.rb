require 'rails_helper'

describe ChurchesController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:church) { create(:church) }

  context 'admin' do
    before { sign_in admin }

    describe 'GET #index' do
      it 'populates an array of churches' do
        get :index
        expect(assigns(:churches)).to eq([church])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested church to @church' do
        get :show, id: church
        expect(assigns(:church)).to eq(church)
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'admin creates a new church' do
          expect{
            post :create, church: attributes_for(:church)
          }.to change(Church, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new church' do
          expect{
            post :create, church: attributes_for(:invalid_church)
          }.to_not change(Church, :count)
        end
      end

      describe 'PUT update' do
        context 'valid attributes' do
          it 'located the requested church' do
            put :update, id: church, church: attributes_for(:church)
            expect(assigns(:church)).to eq(church)
          end

          it 'changes church\'s attributes' do
            put :update, id: church, church: attributes_for(:church, name: 'Catholic')
            church.reload
            expect(church.name).to eq('Catholic')
          end

          it 'redirects to the updated church' do
            put :update, id: church, church: attributes_for(:church)
            expect(response).to redirect_to(churches_path)
          end
        end

        context 'invalid attributes' do
          it 'locates the requested church' do
            put :update, id: church, church: attributes_for(:invalid_church)
            expect(assigns(:church)).to eq(church)
          end

          it 'does not change church\'s attributes' do
            put :update, id: church, church: attributes_for(:invalid_church, name: '', founder: 'Messiah')
            church.reload
            expect(church.founder).not_to eq('Messiah')
            expect(church.founder).to eq('Jesus Christ')
          end
        end
      end
    end
  end

  context 'user' do
    before { sign_in user }

    describe 'GET #index' do
      it 'populates an array of churches' do
        get :index
        expect(assigns(:churches)).to eq([church])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested church to @church' do
        get :show, id: church
        expect(assigns(:church)).to eq(church)
      end
    end
  end
end
