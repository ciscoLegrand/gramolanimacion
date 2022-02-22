class LegalTextsController < ApplicationController
  before_action :set_legal_text, only: %i[show edit update destroy]

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
      redirect_to @legal_text, notice: 'Legal text was successfully created.'
    else
      render :new
    end
  end

  def update
    if @legal_text.update(legal_text_params)
      redirect_to @legal_text, notice: 'Legal text was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @legal_text.destroy
    redirect_to legal_texts_url, notice: 'Legal text was successfully destroyed.'
  end

  private 
   def set_legal_text
    @legal_text = LegalText.friendly.find(params[:id])
   end
   def legal_text_params
    params.require(:legal_text).permit(:title, :content)
   end
end
