module Api
  module V1
    class StoresController < ApplicationController
      before_action :set_store, only: [:show, :update, :destroy]

      def index
        @stores = Store.all.order("updated_at DESC")
        render json: { stores: @stores }, status: 200
      end

      def show
        render json: { store: @store }, status: 200
      end

      def create
        @store = Store.new(store_params)

        if @store.save
          render json: { notice: "Successfully created #{@store.name}" }, status: 201
        else
          render json: { error: @store.error }, status: 422
        end
      end

      def update
        if @store.update(store_params)
          render json: { notice: "Successfully updated #{@store.name}" }, status: 200
        else
          render json: { error: @store.error }, status: 422
        end
      end

      def destroy
        if @store.destroy
          render json: { notice: "Successfully deleted the store" }, status: 200
        else
          render json: { error: @store.error }, status: 422
        end
      end

      private
      def set_store
        @store = Store.find_by(id: params[:id])
      end

      def store_params
        params.require(:store).permit(:name, :url)
      end
    end
  end
end
