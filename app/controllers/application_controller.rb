class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def autenticado
    unless logged_in?
      redirect_to root_url, alert: 'Usuário não logado.'
    end
  end

  def usuario_correto_ou_admin? (pessoa)
    unless current_user.present? && current_user.permissao.administracao
      unless current_user == pessoa
        redirect_to root_url, alert: 'Usuário não possui permissão de acesso.'
      end      
    end
  end
  
  def somente_administrador
    unless current_user.present? && current_user.permissao.administracao
      redirect_to root_url, alert: 'Usuário não possui permissão de acesso.'
    end
  end

  def somente_passeador_ou_admin
    unless current_user.present? && ( current_user.permissao.administracao || current_user.permissao.passeio )
      redirect_to root_url, alert: 'Usuário não possui permissão de acesso.'
    end
  end
end
