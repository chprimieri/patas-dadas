$ ->
  # infelizmente combos do Semantic não são "desselecionáveis", 
  # portanto inserimos um botãozinho de remover em cada combo semantic e trata seu clique como remoção do item
  window.tornar_combos_desselecionaveis = () ->
    $('select + .dropdown.icon').before '<i class="remove icon" title="Limpar"></i>'
    $('.ui.dropdown .remove.icon').on 'click', (e) ->
      $(e.currentTarget).parent('.dropdown').dropdown 'clear'
      e.stopPropagation()
      e.preventDefault()
      
  $('.message .close').on 'click', ->
    $(@).closest('.message').transition 'fade'

  $('.ui.accordion').accordion()
  $('.ui.checkbox').checkbox()
  $('[data-content], [title]').popup()
  $('.ui.sticky').sticky()
  $('.modal').modal
    allowMultiple: false

  # impede tecla Enter de fazer submit do form
  $('form').on 'keypress', '.search .prompt', (e) ->
    e.preventDefault() if e.keyCode == 13

  $('.menu .item')
    .tab()

  # hack pra exibir corretamente campos com erro no formato SemanticUI
  $(':input.error').closest('.field').addClass 'error'

  # combos do Semantic não se resetam sozinhos, infelizmente
  $('form').on 'click', ':reset', (e) ->
    $(e.currentTarget).closest('form').find('.ui.dropdown').dropdown 'clear'

  tornar_combos_desselecionaveis()