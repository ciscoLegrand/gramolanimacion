class EmailCustomTemplatesController < ApplicationController
  before_action :set_email_base_template 
  before_action :set_email_custom_template, only: %i[ show  edit update destroy ]

  def index
    @email_custom_templates = @email_base_template.email_custom_templates
  end

  def show
  end

  def new
    @email_custom_template = @email_base_template.email_custom_templates.build 
  end

  def edit
  end

  def create  
    @email_custom_template = @email_base_template.email_custom_templates.build(email_custom_template_params)
    respond_to do |format|
      if @email_custom_template.save
        format.turbo_stream {
          render turbo_stream:  turbo_stream.prepend(
                                  'email_custom_template', 
                                  partial: 'email_custom_templates/email_custom_template', 
                                  locals: {email_custom_template: @email_custom_template}
                                ) 
        }
        format.html { 
          redirect_to email_base_template_path, 
          success: "#{@email_custom_template.base_title} was successfully created." 
        }
      else
      redirect_to email_base_template_path, 
      alert: "email_custom_template was not successfully created."
      end
    end
  end

  def update 
    respond_to do |format|
      if @email_custom_template.update(email_custom_template_params)
        format.html { 
          redirect_to email_base_templates_path, 
          success: "#{@email_custom_template.base_title} was successfully updated." 
        }
        format.turbo_stream
      else
        redirect_to email_base_template_path, 
        alert: "email_custom_template was not successfully created."
      end
    end
  end

  def destroy 
    name = @email_custom_template.base_title
    @email_custom_template.destroy
    respond_to do |format|
      format.html { 
        redirect_to email_base_templates_path, 
        notice: "#{name} was successfully destroyed." 
      }
      format.turbo_stream
    end
  end

  private 
    def email_custom_template_params
      params.require(:email_custom_template).permit(:email_base_template_id, :content)
    end

    def set_email_base_template 
      @email_base_template = EmailBaseTemplate.friendly.find(params[:email_base_template_id])
    end

    def set_email_custom_template 
      @email_custom_template = @email_base_template.email_custom_templates.find_or_initialize_by(id: params[:id])
    end
end
