class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    unless logged_in?
      redirect_to root_url, alert: 'Usuário não logado.'
    end
  end

  def correct_user?
    unless current_user.present? && current_user.permissao.administracao
      @pessoa = Pessoa.find(params[:id])
      unless current_user == @pessoa
        redirect_to root_url, alert: 'Usuário não possui permissão de acesso.'
      end      
    end
  end

  def correct_user_passeios?
    @passeio = Passeio.find(params[:id])
    unless current_user == @passeio.pessoa
      redirect_to passeios_path, alert: 'Usuário não possui permissão de acesso.'
    end
  end
  
  def somente_administrador
    unless current_user.present? && current_user.permissao.administracao
      redirect_to root_url, alert: 'Usuário não possui permissão de acesso.'
    end
  end
end
