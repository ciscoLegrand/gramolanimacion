class EmailBaseTemplatesController < ApplicationController
  before_action :email_base_template_params, only: %i[create update] 
  before_action :set_email_base_template, only: %i[show edit update destroy]
  before_action :ensure_frame_response, only: %i[new edit]

  def index 
    @email_base_templates = EmailBaseTemplate.all
    @headers = ['Title', 'Kind']
    @attrs =  [:title, :kind]
  end 

  def show
    template = @email_base_template.has_custom_template? ? @email_base_template.custom_template : @email_base_template
    @template = Liquid::Template.parse(template.content) 
  end

  def new 
    @email_base_template = EmailBaseTemplate.new
  end
  
  def create 
    @email_base_template = EmailBaseTemplate.new(email_base_template_params)
    if @email_base_template.save
      respond_to do |format|
        format.turbo_stream { 
          render turbo_stream:  turbo_stream.prepend(
                                  'email_base_template', 
                                  partial: 'email_base_templates/email_base_template', 
                                  locals: {email_base_template: @email_base_template}
                                ) 
        }

        format.html { 
          redirect_to email_base_templates_path, 
          success: "email_base_template was successfully created." 
        }
      end
    else
      redirect_to email_base_templates_path, 
      alert: "email_base_template was not successfully created."
    end
  end

  def edit 
  end

  def update 
    if @email_base_template.update(email_base_template_params)
      respond_to do |format|
        format.turbo_stream { 
          render turbo_stream:  turbo_stream.replace(
                                  @email_base_template, 
                                  partial: "email_base_templates/email_base_template", 
                                  locals: { email_base_template: @email_base_template }
                                ) 
        }

        format.html { 
          redirect_to email_base_templates_path, 
          success: "#{@email_base_template.title} was successfully updated." 
        }
      end
    else
      redirect_to email_base_templates_path, 
      alert: "#{@email_base_template.title} was not successfully updated."
    end
  end

  def destroy 
    name = @email_base_template.title
    @email_base_template.destroy
    respond_to do |format|
      format.html { 
        redirect_to email_base_templates_path, 
        notice: "#{name} was successfully destroyed." 
      }
      format.turbo_stream
    end
  end

  private 
    def email_base_template_params 
      params.require(:email_base_template).permit(:title, :content, :kind)
    end

    def set_email_base_template 
      @email_base_template = EmailBaseTemplate.friendly.find(params[:id])
    end

    def ensure_frame_response
      return unless Rails.env.development?
      redirect_to root_path unless turbo_frame_request?
    end
end
