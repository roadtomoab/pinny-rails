class PinsController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:index]


    def index
        render json: Pin.all
    end

    def show
        pin = Pin.find_by_id(params[:id])
        if pin
            render json: pin, status: :ok
        else
            render_not_found_message
        end
    end

    def create
        user_id = session[:user_id]
        params[:user_id] = user_id
        if pin.valid?
            render json: pin, status: :created
        else
            render json: { errors: pin.errors.full_message }, status: :unprocessable_entity
        end
    end

    def destroy
        pin = Pin.find_by_id(params[:id])
        if pin
            pin.destroy
            head :no_content
        else
            render_not_found_message
        end
    end

    private

    def authorize
        return render json: { error: "Must be logged in to drop a pin" }, status: :unauthorized unless session.include? :user_id
    end

    def pin_params
        params.permit(:title, :desc, :latitude, :longitude, :user_id)
    end

    def render_not_found_message
        render json: { error: "pin not found" }
    end
end
