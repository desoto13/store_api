module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_store
      before_action :set_product, only: [:show, :update, :destroy]

      def index
        @products = @store.products.all.order("inventory_updated_time DESC")
        render json: { products: @products }, status: 200
      end

      def show
        render json: { product: @product }, status: 200
      end

      def create
        @product = @store.products.build(product_params)

        if @product.save
          render json: { notice: "Successfully created #{@product.name}" }, status: 201
        else
          render json: { error: @product.error }, status: 422
        end
      end

      def update
        if @product.update(product_params)
          render json: { notice: "Successfully updated #{@product.name}" }, status: 200
        else
          render json: { error: @product.error }, status: 422
        end
      end

      def destroy
        if @product.destroy
          render json: { notice: "Successfully deleted the product" }, status: 200
        else
          render json: { error: @product.error }, status: 422
        end
      end

      private
      def set_store
        @store = Store.find_by(id: params[:store_id])
      end

      def set_product
        @product = @store.products.find_by(id: params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :sku, :inventory_quantity)
      end
    end    
  end
end
