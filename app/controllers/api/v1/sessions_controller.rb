class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :destroy]
  def create
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email, :authentication_token, :fullname, :stripe_customer_id, :subscription_status, :plan]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
  end
end
