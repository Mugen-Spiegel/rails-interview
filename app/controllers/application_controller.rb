class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: :isValidTenant?

  private 
  def isValidTenant?
    current_tenant = Tenant.where(api_key: request.headers['HTTP_API_KEY'])
    if !current_tenant.exists?
      head :forbidden
    else 
      current_tenant = current_tenant.first
      if current_tenant.request_count.nil?
        current_tenant.request_count = 1
      else 
        current_tenant.request_count = current_tenant.request_count + 1
      end
      current_tenant.save
    end
  end
end
