class AdminUserQuery
  attr_reader :params, :admin_users

  def initialize(params)
    @params = params
  end

  def all
    @admin_users = if params[:employer_id].present?
                     AdminUser.unscoped.where(employer_id: params[:employer_id])
                   else
                     AdminUser.unscoped
                   end
                     .where('admin_users.email ilike ?', "%#{params[:email]}%")
                     .sort_with(field: params[:sort_field], direction: params[:sort_direction] || 'asc')
    if params[:created_by].present?
      @admin_users = @admin_users.where(created_by: params[:created_by])
    end
    @admin_users = @admin_users.where('name ilike ?', "%#{params[:name]}%")
    if params[:admin_only]
      @admin_users = @admin_users.admin_or_above
    end
    @admin_users.includes(:employer)
                .page(params[:page_index] || params[:page]).per(params[:page_size] || params[:per] || 30)
  end
end
