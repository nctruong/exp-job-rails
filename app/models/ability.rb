# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new

    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      user.permissions.for_admin.each do |permission|
        if permission.condition_attribute.blank?
          can permission.action.to_sym, permission.subject_class.constantize
        else
          can permission.action.to_sym, permission.subject_class.constantize, permission.condition_attribute.to_sym => user.send(permission.condition_value)
        end
      end
    elsif user.employer?
      user.permissions.for_employer.each do |permission|
        if permission.condition_attribute.blank?
          can permission.action.to_sym, permission.subject_class.constantize
        else
          can permission.action.to_sym, permission.subject_class.constantize, permission.condition_attribute.to_sym => user.send(permission.condition_value)
        end
      end
    end
  end
end
