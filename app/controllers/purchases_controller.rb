class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase_from_session, only: [:new, :create]

  def index
    @purchases = current_user.purchases
  end

  def show
    @purchase = current_user.purchases.find(params[:id])
    @line_items = @purchase.line_items
  end

  def new
  end

  def create
    if @purchase.save
      payment_id = @purchase.pay
      # Order is made, empty the shopping cart
      session[:shopping_cart] = {}
      redirect_to purchase_path(@purchase), notice: "Your items have been ordered"
    else
      redirect_to new_purchase_path, alert: "There was an error ordering your items"
    end
  end

  private
    def set_purchase_from_session
      @shopping_cart = session[:shopping_cart]
      @purchase = current_user.purchases.build
      total_price = 0

      @shopping_cart.each do |product_id, amount|
        product = Product.find(product_id)
	      @purchase.line_items.build(product_id: product_id, amount: amount, line_price: product.price * amount)
        total_price += product.price * amount
      end unless @shopping_cart.blank?
      
      @purchase[:total_price] = total_price
      @purchase[:payment_method] = Purchase::PAYMENT_METHODS[1]
      @purchase[:purchase_number] = 2.times.map{ 20 + Random.rand(11) }.join.to_i
    end

    def purchase_params
      params.require(:purchase).permit(:user_id, line_item_ids: [])
    end

    def line_items_params
      params[:line_items].present? ? params.require(:line_items): []
    end
end
