class AuthController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :signup]

    def login
      authenticate params[:username], params[:password]
    end

    def signup
      @user = User.create!(
        first_name: params[:first_name],
        last_name: params[:last_name],
        username: params[:username],
        password: params[:password],
      )
      render json: @user
    end

    private
    def authenticate(username, password)
      user = User.find_by(username: username)
      command = AuthenticateUser.call(username, password)

      if command.success?
        render json: {
          token: command.result
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
     end
  end
