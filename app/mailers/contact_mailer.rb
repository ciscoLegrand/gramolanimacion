class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def contact_form(contact)
    @correo = contact
    # raise @correo.to_json
    @greeting = "hola #{@correo.name}"
    # =>  destinatario del correo  , quien envia el correo
    mail( to: @correo.email,from: 'cisco.glez@gmail.com', subject: @greeting)
  end
end
