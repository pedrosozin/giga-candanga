class ApplicationController < ActionController::Base
  layout 'admin_lte_2'

  protect_from_forgery with: :exception
  before_action :authenticate_usuario!



  MSG_TYPE_INFO = "info"
  MSG_TYPE_SUCCESS = "success"
  MSG_TYPE_ERROR = "error"
end
