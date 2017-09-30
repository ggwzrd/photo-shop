class Api::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_request

  attr_reader :current_user

  def index
    @products = Product.all
    if @products.length > 0
      render json: { products: @products }
    else
      render json: { products: "No product available at the moment" }
    end
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
