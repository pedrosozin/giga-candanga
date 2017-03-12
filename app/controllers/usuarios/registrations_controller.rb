class Usuarios::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, only: [:create]
  before_action :account_update_params, only: [:update]

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :user_created
      end
    end
  end

  protected

  def sign_up_params
    params.require(:usuario).permit(:email, :password, :password_confirmation,
                                    :nome, :telefone, :ativo)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def account_update_params
    params.require(:usuario).permit(:email, :password, :password_confirmation,
                                    :current_password, :nome, :telefone,
                                    :ativo)
  end

end
