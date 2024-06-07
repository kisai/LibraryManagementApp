require 'rails_helper'

RSpec.describe BorrowingPolicy, type: :policy do
  subject { described_class }

  let(:librarian) { create(:user, :librarian) }
  let(:member) { create(:user, :member) }
  let(:borrowing) { create(:borrowing) }

  permissions :create? do
    it 'allows access for members' do
      expect(subject).to permit(member, borrowing)
    end

    it 'denies access for librarians' do
      expect(subject).not_to permit(librarian, borrowing)
    end
  end

  permissions :update? do
    it 'allows access for librarians' do
      expect(subject).to permit(librarian, borrowing)
    end

    it 'denies access for members' do
      expect(subject).not_to permit(member, borrowing)
    end
  end
end
