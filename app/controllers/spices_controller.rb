class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_error
    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end
    private
    def find_spice
        Spice.find(id: params[:id])
    end

    def spice_params
        params.permit(:title, :image, :desciption, :notes, :rating)
    end

    def render_error
        render json: {error: "Record does not exist"}, status: :not_found
    end

end
