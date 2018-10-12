# frozen_string_literal: true

class LeavePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user).includes(:user)
      end
    end
   end

  def show?
    user.present? && user == record.user
  end

  def update?
    user.present? && user == record.user
  end

  def destroy?
    user.present? && user == record.user
  end
end
