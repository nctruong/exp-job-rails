class AdminUserDecorator < Draper::Decorator
  delegate_all

  def current_sign_in_date_long
    h.l_if(current_sign_in_at, format: :long)
  end

  def last_sign_in_date_long
    h.l_if(last_sign_in_at, format: :long)
  end

  def created_date_long
    h.l_if(created_at, format: :long)
  end

  def raw_role
    object.roles.first
  end

  def roles
    object.roles.map { |role| role.to_s.titleize }.join(' - ')
  end
end
