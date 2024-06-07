require 'rails_helper'

RSpec.describe BorrowingsController, type: :controller do
  let(:librarian) { create(:user, :librarian) }
  let(:member) { create(:user, :member) }
  let!(:book) { create(:book) }

  before do
    sign_in member
  end

  describe 'POST #create' do
    let(:valid_attributes) { { book_id: book.id } }

    context 'with valid params' do
      it 'creates a new Borrowing' do
        expect {
          post :create, params: { borrowing: valid_attributes }, format: :json
        }.to change(Borrowing, :count).by(1)
      end

      it 'renders a JSON response with the new borrowing' do
        post :create, params: { borrowing: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/#{book.title}/)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new borrowing' do
        post :create, params: { borrowing: { book_id: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  describe 'PUT #update' do
    let!(:borrowing) { create(:borrowing, user: member, book: book) }

    it 'updates the requested borrowing as returned' do
      put :update, params: { id: borrowing.id }, format: :json
      borrowing.reload
      expect(borrowing.returned_on).to eq(Date.today)
    end

    it 'renders a JSON response with the borrowing' do
      put :update, params: { id: borrowing.id }, format: :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
      expect(response.body).to match(/#{book.title}/)
    end
  end
end
