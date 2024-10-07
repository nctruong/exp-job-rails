# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new

    case user.role
      when :super_admin
        can :manage, :all
      when :admin
        verify_admin(user)
      when :employer
        verify_employer(user)
    end
  end

  private

  def verify_employer(user)
    user.permissions.for_employer.each do |permission|
      if permission.condition_attribute.blank?
        can permission.action.to_sym, permission.subject_class.constantize
      else
        can permission.action.to_sym, permission.subject_class.constantize,
            permission.condition_attribute.to_sym => user.send(permission.condition_value)
      end
    end
  end

  def verify_admin(user)
    user.permissions.for_admin.each do |permission|
      if permission.condition_attribute.blank?
        can permission.action.to_sym, permission.subject_class.constantize
      else
        can permission.action.to_sym, permission.subject_class.constantize,
            permission.condition_attribute.to_sym => user.send(permission.condition_value)
      end
    end
  end
end
