# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if user_signed_in?
      redirect_to '/dashboard/index', notice: 'Inició Sesión Exitosamente'
    else
      redirect_to user_session_path, alert: 'Datos de ingreso incorrectos'
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out(current_user)
    redirect_to root_path, notice: 'Cerró Sesión Exitosamente'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
