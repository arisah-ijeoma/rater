require 'rails_helper'

describe SchoolsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:school) { create(:school) }

  context 'admin' do
    before { sign_in admin }

    describe 'GET #index' do
      it 'populates an array of schools' do
        get :index
        expect(assigns(:schools)).to eq([school])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested school to @school' do
        get :show, id: school
        expect(assigns(:school)).to eq(school)
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'admin creates a new school' do
          expect{
            post :create, school: attributes_for(:school)
          }.to change(School, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new school' do
          expect{
            post :create, school: attributes_for(:invalid_school)
          }.to_not change(School, :count)
        end
      end

      describe 'PUT update' do
        context 'valid attributes' do
          it 'located the requested school' do
            put :update, id: school, school: attributes_for(:school)
            expect(assigns(:school)).to eq(school)
          end

          it 'changes school\'s attributes' do
            put :update, id: school, school: attributes_for(:school, aka: 'MOUAU')
            school.reload
            expect(school.aka).to eq('MOUAU')
          end

          it 'redirects to the updated school' do
            put :update, id: school, school: attributes_for(:school)
            expect(response).to redirect_to(school_path(school))
          end
        end

        context 'invalid attributes' do
          it 'locates the requested school' do
            put :update, id: school, school: attributes_for(:invalid_school)
            expect(assigns(:school)).to eq(school)
          end

          it 'does not change school\'s attributes' do
            put :update, id: school, school: attributes_for(:invalid_school, name: '', aka: 'MMM')
            school.reload
            expect(school.aka).not_to eq('MMM')
            expect(school.aka).to eq('FUTO')
          end
        end
      end
    end
  end

  context 'user' do
    before { sign_in user }

    describe 'GET #index' do
      it 'populates an array of school' do
        get :index
        expect(assigns(:schools)).to eq([school])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested church to @school' do
        get :show, id: school
        expect(assigns(:school)).to eq(school)
      end
    end
  end
end
