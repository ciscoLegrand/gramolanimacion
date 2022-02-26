class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :alert, :info, :notice
end
