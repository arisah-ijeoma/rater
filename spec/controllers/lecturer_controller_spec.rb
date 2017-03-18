require 'rails_helper'

describe LecturersController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:school) { create(:school) }
  let(:lecturer) { create(:lecturer, school_id: school.id) }

  context 'admin' do
    before { sign_in admin }
    describe 'POST create' do
      context 'with valid attributes' do
        it 'admin creates a new lecturer' do
          expect{
            post :create, school_id: school, lecturer: attributes_for(:lecturer)
          }.to change(Lecturer, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new lecturer' do
          expect{
            post :create, school_id: school, lecturer: attributes_for(:invalid_lecturer)
          }.to_not change(Lecturer, :count)
        end
      end

      describe 'PUT update' do
        context 'valid attributes' do
          it 'located the requested lecturer' do
            put :update, id: lecturer, school_id: school, lecturer: attributes_for(:lecturer)
            expect(assigns(:lecturer)).to eq(lecturer)
          end

          it 'changes lecturer\'s attributes' do
            put :update, id: lecturer, school_id: school, lecturer: attributes_for(:lecturer, name: 'Amara')
            lecturer.reload
            expect(lecturer.name).to eq('Amara')
          end

          it 'redirects to the updated lecturer' do
            put :update, id: lecturer, school_id: school, lecturer: attributes_for(:lecturer)
            expect(response).to redirect_to(school_path(school))
          end
        end

        context 'invalid attributes' do
          it 'locates the requested lecturer' do
            put :update, id: lecturer, school_id: school, lecturer: attributes_for(:invalid_lecturer)
            expect(assigns(:lecturer)).to eq(lecturer)
          end

          it 'does not change lecturer\'s attributes' do
            put :update, id: lecturer, school_id: school, lecturer: attributes_for(:invalid_lecturer, name: '')
            lecturer.reload
            expect(lecturer.name).not_to eq('')
            expect(lecturer.name).to eq('My Prince')
          end
        end
      end
    end
  end
end
