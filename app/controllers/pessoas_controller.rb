class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]
  # confere se as pessoas estão logadas para acessar as páginas, com exceção do cadastro inicial
  before_action :autenticado, except: [:new, :create] 
  # confere se é administrador ou o usuário correto para exibir, editar e excluir seus dados
  before_action only: [:show, :edit, :update, :destroy] do
    usuario_correto_ou_admin? ( Pessoa.find(params[:id]) )
  end
  before_action :somente_administrador, only: [:index]

  # GET /pessoas
  # GET /pessoas.json
  def index
    @pessoas = Pessoa.all
  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
    @lista_de_passeios = Pessoa.find(params[:id]).passeios
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  # GET /pessoas/1/edit
  def edit
    @pessoa = Pessoa.find(params[:id])
  end

  # POST /pessoas
  # POST /pessoas.json
  def create
    @pessoa = Pessoa.new(pessoa_params)

    if @pessoa.save
      redirect_to @pessoa, notice: 'Voluntário(a) cadastrado com sucesso!'

      if current_user.nil?
        sign_in(@pessoa)
      end
    else
      render action: :new
    end
  end

  # PATCH/PUT /pessoas/1
  # PATCH/PUT /pessoas/1.json
  def update
    @pessoa = Pessoa.find(params[:id]) 

    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to @pessoa, notice: 'Dados atualizados com sucesso!' }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    @pessoa = Pessoa.find(params[:id])

    if current_user == @pessoa
      sign_out
    end
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: 'Dados do voluntário(a) apagados.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :data_de_nascimento, :email, :telefone, :password, :password_confirmation)
    end
end
