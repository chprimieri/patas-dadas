class PermissoesController < ApplicationController
  before_action :set_permissao, only: [:show, :edit, :update, :destroy]
  before_action :autenticado
  # apenas administradores tem acesso as páginas da classe Permissão
  before_action :somente_administrador

  # GET /permissoes
  # GET /permissoes.json
  def index
    @permissoes = Permissao.all
  end

  # GET /permissoes/1
  # GET /permissoes/1.json
  def show
  end

  # GET /permissoes/new
  def new
    @permissao = Permissao.new
  end

  # GET /permissoes/1/edit
  def edit
  end

  # POST /permissoes
  # POST /permissoes.json
  def create
    @permissao = Permissao.new(permissao_params)

    respond_to do |format|
      if @permissao.save
        format.html { redirect_to @permissao, notice: 'As permissões do voluntário foram criadas.' }
        format.json { render :show, status: :created, location: @permissao }
      else
        format.html { render :new }
        format.json { render json: @permissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissoes/1
  # PATCH/PUT /permissoes/1.json
  def update
    respond_to do |format|
      if @permissao.update(permissao_params)
        format.html { redirect_to @permissao, notice: 'As permissões do voluntário foram atualizadas.' }
        format.json { render :show, status: :ok, location: @permissao }
      else
        format.html { render :edit }
        format.json { render json: @permissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissoes/1
  # DELETE /permissoes/1.json
  def destroy
    @permissao.destroy
    respond_to do |format|
      format.html { redirect_to permissoes_url, notice: 'As permissões do voluntário foram excluídas.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permissao
      @permissao = Permissao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permissao_params
      params.require(:permissao).permit(:pessoa_id, :administracao, :passeio)
    end
end
