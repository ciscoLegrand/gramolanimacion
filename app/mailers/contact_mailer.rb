class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def contact_form(contact)
    @correo = contact
    # raise @correo.to_json
    @greeting = "consulta de #{@correo.name}"
    # =>  destinatario del correo  , quien envia el correo
    mail( to: 'cisco.glez@gmail.com' ,from: @correo.email, subject: @greeting)
  end
end
