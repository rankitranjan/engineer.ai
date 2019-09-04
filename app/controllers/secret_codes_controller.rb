class SecretCodesController < ApplicationController

  def index
    @secret_codes = SecretCode.order("id desc")
  end

  def bulk_create
  	if params[:no_of_secret_code].present? && (SecretCode::NO_OF_SECRET_CODE.include? (params[:no_of_secret_code].to_i))
  		no_of_secret_code = params[:no_of_secret_code]
  		SecretCode.create_secret_codes(no_of_secret_code)
  		redirect_to secret_codes_path, notice: 'Secret codes was successfully generated.'
  	else
  		redirect_to secret_codes_path, alert: 'Something went wrong'
  	end
  end

end
