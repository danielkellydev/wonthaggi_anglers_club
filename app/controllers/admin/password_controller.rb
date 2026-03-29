module Admin
  class PasswordController < BaseController
    def edit
    end

    def update
      user = Current.session.user

      unless user.authenticate(params[:current_password])
        flash.now[:alert] = "Current password is incorrect."
        return render :edit, status: :unprocessable_entity
      end

      if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
        redirect_to admin_root_path, notice: "Password updated."
      else
        flash.now[:alert] = user.errors.full_messages.to_sentence
        render :edit, status: :unprocessable_entity
      end
    end
  end
end
