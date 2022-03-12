class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :ensure_frame_response, only: %i[new edit]
  
  def index
    @categories = Category.all
    @headers = ['Name', 'Description']
    @attrs =  [:name, :description]
  end

  def show 
  end

  def new 
    @category = Category.new
  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.turbo_stream { 
          render turbo_stream:  turbo_stream.prepend(
                                  'category', 
                                  partial: 'categories/category', 
                                  locals: {category: @category}
                                ) 
        }

        format.html { 
          redirect_to categories_url, 
          success: "category was successfully created." 
        }
      end
    else
      redirect_to categories_url, 
      alert: "category was not successfully created."
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.turbo_stream { 
          render turbo_stream:  turbo_stream.replace(
                                  @category, 
                                  partial: "categories/category", 
                                  locals: { category: @category }
                                ) 
        }

        format.html { 
          redirect_to categories_url, 
          success: "#{@category.name} was successfully updated." 
        }
      end
    else
      redirect_to categories_url, 
      alert: "#{@category.name} was not successfully updated."
    end
  end

  def destroy 
    name = @category.name
    @category.destroy
    respond_to do |format| 
      format.html { 
        redirect_to categories_url, 
        notice: "#{name} was successfully destroyed." 
      }
      format.turbo_stream
    end
  end

  private 
    def category_params
      params.require(:category).permit(:name, :description)
    end

    def set_category  
      @category = Category.friendly.find(params[:id])
    end

    def ensure_frame_response
      return unless Rails.env.development?
      redirect_to root_path unless turbo_frame_request?
    end
end
