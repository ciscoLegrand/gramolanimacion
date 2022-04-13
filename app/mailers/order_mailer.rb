class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def user_order(order)
    @order = order
    # raise @correo.to_json
    @greeting = "Gracias por inscribirte"
    # =>  destinatario del correo  , quien envia el correo
    mail( to:  @order.email  ,from: 'cisco.glez@gmail.com', subject: @greeting)
  end

  def admin_order(order)
    @order = order
    # raise @correo.to_json
    @greeting = "Gracias por inscribirte"
    # =>  destinatario del correo  , quien envia el correo
    mail( to: 'cisco.glez@gmail.com' ,from:  @order.email , subject: @greeting)
  end
end