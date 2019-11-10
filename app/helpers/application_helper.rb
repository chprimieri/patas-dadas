module ApplicationHelper
	def botao_salvar(form)
    form.submit 'Salvar', class: 'ui primary button', data: { disable_with: 'Salvando...' }
  end

  def administrador?
    if current_user.present?
      current_user.permissao.administracao
    else
      false
    end
  end

  def passeador?
    if current_user.present?
      if current_user.permissao.administracao
        true
      else
        current_user.permissao.passeio
      end
    else
      false
    end
  end
end
