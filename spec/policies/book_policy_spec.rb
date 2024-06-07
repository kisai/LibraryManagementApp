require 'rails_helper'

RSpec.describe BookPolicy, type: :policy do
  subject { described_class }

  let(:librarian) { create(:user, :librarian) }
  let(:member) { create(:user, :member) }
  let(:book) { create(:book) }

  permissions :index?, :show? do
    it 'allows access for members and librarians' do
      expect(subject).to permit(librarian, book)
      expect(subject).to permit(member, book)
    end
  end

  permissions :create?, :update?, :destroy? do
    it 'allows access only for librarians' do
      expect(subject).to permit(librarian, book)
      expect(subject).not_to permit(member, book)
    end
  end
end
