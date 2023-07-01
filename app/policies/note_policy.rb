class NotePolicy < ApplicationPolicy
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

  #
  # scope
  #
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
