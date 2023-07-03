class CompanyPolicy < ApplicationPolicy

  def index?
    viewer? || editor? || admin?
  end

  def show?
    viewer? || editor? || admin?
  end

  def create?
    editor? || admin?
  end

  def update?
    editor? || admin?
  end

  def destroy?
    admin?
  end

  def search?
    viewer? || editor? || admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
