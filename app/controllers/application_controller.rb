class ApplicationController < ActionController::Base
  layout "admin_lte_2"

  protect_from_forgery with: :exception
  before_action :authenticate_usuario!

  MSG_TYPE_INFO = "info".freeze
  MSG_TYPE_SUCCESS = "success".freeze
  MSG_TYPE_ERROR = "error".freeze
end
