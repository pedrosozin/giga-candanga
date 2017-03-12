class BaseDeviseController < ActionController::Base
  layout "admin_lte_2_login", except: [:create]
end
