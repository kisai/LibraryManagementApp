class BookPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.librarian?
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
