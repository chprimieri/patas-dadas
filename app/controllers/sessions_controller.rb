class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def new
  end

  def create  
		@pessoa = Pessoa.find_by(email: params[:session][:email].downcase)

    if @pessoa && @pessoa.authenticate(params[:session][:password])
      sign_in @pessoa
    	redirect_to @pessoa
		else
      render action: :new
		end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end