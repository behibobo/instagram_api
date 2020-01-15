class UploaderController < ApplicationController
    def create_avatar
        @image = Image.new(name: params[:image])
        @image.save
        current_user.update(avatar: @image.name)
        render json: current_user, status: :created
    end

    def upload_post_image
        @image = Image.new(name: params[:image])
        @image.save
        render json: {
            image: @image.name
        }, status: :created

    end
end
