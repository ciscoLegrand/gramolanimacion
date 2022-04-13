class DataEnterprisesController < ApplicationController 
  before_action :set_data_enterprise, only: %w[edit update]

  def edit 
    @data_enterprise = DataEnterprise.first
  end

  def update 
    @data_enterprise = DataEnterprise.first
    @data_enterprise.update!(data_enterprise_params)
  end


  private 
    def set_data_enterprise 
      @data_enterprise = DataEnterprise.first
    end

    def data_enterprise_params
      params.require(:data_enterprise).permit(:commercial_name, :business_name, :nif, :wide_transfer, :meta_title, :meta_description, :url, :about, :facebook_url, :twitter_url, :instagram_url, :bodasnet_url, :gramoladisco_url, :logo)
    end
end