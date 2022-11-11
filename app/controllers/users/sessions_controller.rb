class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
  render json: { message: 'Login successfully!',user:resource},:except =>  [:jti], status: :ok
  end

  def respond_to_on_destroy
    current_user = get_user_from_token

    if current_user
      render json: { message: 'User logged out successfully'},status: :ok
    else
      render json: {message: 'Fail to logout user',errors:resource.errors.full_messages},
      status: :unprocessable_entity
    end
  end
end