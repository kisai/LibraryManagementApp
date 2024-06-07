class BorrowingPolicy < ApplicationPolicy
  def index?
    user.librarian? || user.member?
  end

  def create?
    user.member?
  end

  def new?
    create?
  end

  def update?
    user.librarian?
  end

  def edit?
    update?
  end

  def destroy?
    user.librarian?
  end
end
