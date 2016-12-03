class SessionsController < ApplicationController
  def new
  end


#POST no se ve
  def create
    user = User.find_by_email(sessions_params[:email])
    if user and user.authenticate(sessions_params[:password])
      login user
    end
    redirect_to rooth_path
  end

#DELETE Destroy
  def delete
    logout
    redirect_to rooth_path
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password, :password_confirm)
  end

end
