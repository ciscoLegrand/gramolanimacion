class LegalTextsController < ApplicationController
  before_action :set_legal_text, only: %i[show edit update destroy]
  before_action :ensure_frame_response, only: %i[new edit]
  def index
    @legal_texts = LegalText.all
    @headers = ['Title',  '', 'Actions']
    @attrs =  [:title]
  end

  def show
  end

  def new
    @legal_text = LegalText.new
  end

  def edit
  end

  def create
    @legal_text = LegalText.new(legal_text_params)
    if @legal_text.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('legal_text', partial: 'legal_texts/legal_text', locals: {legal_text: @legal_text}) }
        format.html { redirect_to legal_texts_path, success: "legal_text was successfully created." }
      end
    else
      redirect_to legal_texts_path, alert: "legal_text was not successfully created."
    end
  end

  def update
    if @legal_text.update(legal_text_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@legal_text, partial: "legal_texts/legal_text", locals: {legal_text: @legal_text}) }
        format.html { redirect_to legal_texts_path, success: "#{@legal_text.title} was successfully updated." }
      end
    else
      redirect_to legal_texts_path, alert: "#{@legal_text.title} was not successfully updated."
    end
  end

  def destroy
    name = @legal_text.title
    @legal_text.destroy
    respond_to do |format|
      format.html { redirect_to legal_texts_path, notice: "#{name} was successfully destroyed." }
      format.turbo_stream
    end
  end

  private 
   def set_legal_text
    @legal_text = LegalText.friendly.find(params[:id])
   end
   def legal_text_params
    params.require(:legal_text).permit(:title, :content)
   end

   def ensure_frame_response
    return unless Rails.env.development?
    redirect_to root_path unless turbo_frame_request?
   end
end
