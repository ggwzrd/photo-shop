class PurchaseMailer < ActionMailer::Base
  default from: 'photoshopgiulio@gmail.com'
  layout 'mailer'

  def confirm_order order
    @order = order
    @user = order.user
    if @order
      mail to: @user.email, subject: "Order confirmation for orden n: #{@order.purchase_number}"
    end
  end

end
