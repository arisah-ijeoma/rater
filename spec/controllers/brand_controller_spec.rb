require 'rails_helper'

describe BrandsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:brand) { create(:brand) }

  context 'admin' do
    before { sign_in admin }

    describe 'GET #index' do
      it 'populates an array of brands' do
        get :index
        expect(assigns(:brands)).to eq([brand])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested church to @brand' do
        get :show, id: brand
        expect(assigns(:brand)).to eq(brand)
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'admin creates a new brand' do
          expect{
            post :create, brand: attributes_for(:brand)
          }.to change(Brand, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new brand' do
          expect{
            post :create, brand: attributes_for(:invalid_brand)
          }.to_not change(Brand, :count)
        end
      end

      describe 'PUT update' do
        context 'valid attributes' do
          it 'located the requested brand' do
            put :update, id: brand, brand: attributes_for(:brand)
            expect(assigns(:brand)).to eq(brand)
          end

          it 'changes brand\'s attributes' do
            put :update, id: brand, brand: attributes_for(:brand, name: 'VisaPhone')
            brand.reload
            expect(brand.name).to eq('VisaPhone')
          end

          it 'redirects to the updated brand' do
            put :update, id: brand, brand: attributes_for(:brand)
            expect(response).to redirect_to(brand_path(brand))
          end
        end

        context 'invalid attributes' do
          it 'locates the requested brand' do
            put :update, id: brand, brand: attributes_for(:invalid_brand)
            expect(assigns(:brand)).to eq(brand)
          end

          it 'does not change brand\'s attributes' do
            put :update, id: brand, brand: attributes_for(:invalid_brand)
            brand.reload
            expect(brand.name).not_to eq('')
            expect(brand.name).to eq('MTN')
          end
        end
      end
    end
  end

  context 'user' do
    before { sign_in user }

    describe 'GET #index' do
      it 'populates an array of brands' do
        get :index
        expect(assigns(:brands)).to eq([brand])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested brand to @brand' do
        get :show, id: brand
        expect(assigns(:brand)).to eq(brand)
      end
    end
  end
end
