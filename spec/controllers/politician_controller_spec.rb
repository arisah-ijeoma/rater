require 'rails_helper'

describe PoliticiansController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:politician) { create(:politician) }

  context 'admin' do
    before { sign_in admin }

    describe 'GET #index' do
      it 'populates an array of politicians' do
        get :index
        expect(assigns(:politicians)).to eq([politician])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested church to @politician' do
        get :show, id: politician
        expect(assigns(:politician)).to eq(politician)
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'admin creates a new politician' do
          expect{
            post :create, politician: attributes_for(:politician)
          }.to change(Politician, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new politician' do
          expect{
            post :create, politician: attributes_for(:invalid_politician)
          }.to_not change(Politician, :count)
        end
      end

      describe 'PUT update' do
        context 'valid attributes' do
          it 'located the requested politician' do
            put :update, id: politician, politician: attributes_for(:politician)
            expect(assigns(:politician)).to eq(politician)
          end

          it 'changes politician\'s attributes' do
            put :update, id: politician, politician: attributes_for(:politician, name: 'Jay Jay')
            politician.reload
            expect(politician.name).to eq('Jay Jay')
          end

          it 'redirects to the updated politician' do
            put :update, id: politician, politician: attributes_for(:politician)
            expect(response).to redirect_to(politician_path(politician))
          end
        end

        context 'invalid attributes' do
          it 'locates the requested politician' do
            put :update, id: politician, politician: attributes_for(:invalid_politician)
            expect(assigns(:politician)).to eq(politician)
          end

          it 'does not change church\'s attributes' do
            put :update, id: politician, politician: attributes_for(:invalid_politician, name: 'Jay Jay')
            politician.reload
            expect(politician.name).not_to eq('Ijeoma Aarisah')
            expect(politician.name).to eq('Jay Jay')
          end
        end
      end
    end
  end

  context 'user' do
    before { sign_in user }

    describe 'GET #index' do
      it 'populates an array of politician' do
        get :index
        expect(assigns(:politicians)).to eq([politician])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested church to @politician' do
        get :show, id: politician
        expect(assigns(:politician)).to eq(politician)
      end
    end
  end
end
