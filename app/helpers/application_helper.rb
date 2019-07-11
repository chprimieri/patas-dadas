module ApplicationHelper
	def botao_salvar(form)
    form.submit 'Salvar', class: 'ui primary button', data: { disable_with: 'Salvando...' }
  end
end
