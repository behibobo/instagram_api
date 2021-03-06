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

    def update
      if current_user.update(user_params)
        render json: current_user
      else
        render json: current_user.errors, status: :unprocessable_entity
      end
    end

    def me
      render json: current_user
    end

    def update_password
      @user = User.find(current_user.id)
      unless @user.try(:authenticate, params[:old_password])
        render json: { error: "password is incorrect" }, status: :unauthorized
        return 
      end

      @user.update(password: params[:new_password])
      render json: @user
    end

    private
    def authenticate(username, password)
      user = User.find_by(username: username)
      command = AuthenticateUser.call(username, password)

      if command.success?
        render json: {
          token: command.result,
          user: ActiveModelSerializers::SerializableResource.new(user),
          profile_completed: !(user.first_name.nil? or user.last_name.nil?) 
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

    private
    def user_params
      params.permit(:first_name, :last_name)
    end
  end
