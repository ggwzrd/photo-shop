require 'paypal-sdk-rest'
include PayPal::SDK::REST

class Purchase < ApplicationRecord
  belongs_to :user
  has_many :line_items

  # validates :user, presence: true
  # validates :payment_method, presence: true

  PAYMENT_METHODS = ["iDeal", "PayPal", "Credit Card"]

  def get_total
    total = 0
    line_items.each do |li|
      total += li.get_total
    end
    total
  end

  def pay
    # Build Payment object
    @payment = Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },
      :redirect_urls => {
        :return_url => "http://localhost:3000/payment/execute",
        :cancel_url => "http://localhost:3000/" },
      :transactions =>  [{
        :item_list => {
          :items => self.line_items.map {|line_item| item_details(line_item)}
        },
        :amount =>  {
          :total =>  self.total_price,
          :currency =>  "EUR" },
        :description =>  self.description }]})

    if @payment.create
      self.notify_via_email
      @payment.id     # Payment Id
    else
      @payment.error  # Error Hash
    end
  end

  def description
    purchase_description = "Below you can find an overview of your order:\n\n"
    self.line_items.each do |line_item|
      purchase_description += "#{line_item.product.name} x #{line_item.amount}: &euro; #{line_item.line_price}\n\n"
    end
    purchase_description += "______________________________________________________"
    purchase_description += "Total Price: #{self.get_total}"
  end

  def notify_via_email
    PurchaseMailer.confirm_order(self).deliver_now
  end

  private

  def item_details item
    {
      :name => item.product.name,
      :sku => item.product.name,
      :price => item.line_price,
      :currency => "EUR",
      :quantity => item.amount
    }
  end
end
