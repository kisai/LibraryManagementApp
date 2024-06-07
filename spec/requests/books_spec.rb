require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:librarian) { create(:user, :librarian) }
  let(:member) { create(:user, :member) }
  let!(:book) { create(:book) }

  before do
    sign_in librarian
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: book.id }, format: :json
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:book) }

    context 'with valid params' do
      it 'creates a new Book' do
        expect {
          post :create, params: { book: valid_attributes }, format: :json
        }.to change(Book, :count).by(1)
      end

      it 'renders a JSON response with the new book' do
        post :create, params: { book: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/#{valid_attributes[:title]}/)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new book' do
        post :create, params: { book: { title: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) { { title: 'Updated Title' } }

    context 'with valid params' do
      it 'updates the requested book' do
        put :update, params: { id: book.id, book: new_attributes }, format: :json
        book.reload
        expect(book.title).to eq('Updated Title')
      end

      it 'renders a JSON response with the book' do
        put :update, params: { id: book.id, book: new_attributes }, format: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/Updated Title/)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the book' do
        put :update, params: { id: book.id, book: { title: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested book' do
      expect {
        delete :destroy, params: { id: book.id }, format: :json
      }.to change(Book, :count).by(-1)
    end
  end
end
