require 'rails_helper'

describe TagsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:tag) { create(:tag) }

  context 'admin' do
    before { sign_in admin }

    describe 'GET #index' do
      it 'populates an array of tags' do
        get :index
        expect(assigns(:tags)).to eq([tag])
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'admin creates a new tag' do
          expect{
            post :create, tag: attributes_for(:tag)
          }.to change(Tag, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new tag' do
          expect{
            post :create, tag: attributes_for(:invalid_tag)
          }.to_not change(Tag, :count)
        end
      end

      describe 'PUT update' do
        context 'valid attributes' do
          it 'located the requested tag' do
            put :update, id: tag, tag: attributes_for(:tag)
            expect(assigns(:tag)).to eq(tag)
          end

          it 'changes tag\'s attributes' do
            put :update, id: tag, tag: attributes_for(:tag, description: 'Drink')
            tag.reload
            expect(tag.description).to eq('Drink')
          end

          it 'redirects to the updated tag' do
            put :update, id: tag, tag: attributes_for(:tag)
            expect(response).to redirect_to(tags_path)
          end
        end

        context 'invalid attributes' do
          it 'locates the requested tag' do
            put :update, id: tag, tag: attributes_for(:invalid_tag)
            expect(assigns(:tag)).to eq(tag)
          end

          it 'does not change tag\'s attributes' do
            put :update, id: tag, tag: attributes_for(:invalid_tag)
            tag.reload
            expect(tag.description).to eq('Foodie')
          end
        end
      end
    end
  end

  context 'user' do
    before { sign_in user }

    describe 'GET #index' do
      it 'populates an array of tags' do
        get :index
        expect(assigns(:tags)).to eq([])
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'user can not create tag' do
          expect{
            post :create, tag: attributes_for(:tag)
          }.not_to change(Tag, :count)
        end
      end
    end
  end
end
