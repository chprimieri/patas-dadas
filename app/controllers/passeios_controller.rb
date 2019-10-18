class PasseiosController < ApplicationController
  before_action :set_passeio, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  before_action :correct_user_passeios?, only: [:edit, :update, :destroy]

  # GET /passeios
  # GET /passeios.json
  def index
    @passeios = Passeio.all
  end

  # GET /passeios/1
  # GET /passeios/1.json
  def show
  end

  # GET /passeios/new
  def new
    @passeio = Passeio.new
  end

  # GET /passeios/1/edit
  def edit
  end

  # POST /passeios
  # POST /passeios.json
  def create
    @passeio = Passeio.new(passeio_params)
    @passeio.pessoa_id = current_user.id

    if @passeio.data_e_hora > Time.now()
      @passeio.status = 0
    else
      @passeio.status = 1
    end

    respond_to do |format|
      if @passeio.save
        format.html { redirect_to @passeio, notice: 'Você cadastrou um passeio!' }
        format.json { render :show, status: :created, location: @passeio }
      else
        format.html { render :new }
        format.json { render json: @passeio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passeios/1
  # PATCH/PUT /passeios/1.json
  def update
    respond_to do |format|
      if @passeio.update(passeio_params)
        format.html { redirect_to @passeio, notice: 'Seu passeio foi atualizado!' }
        format.json { render :show, status: :ok, location: @passeio }
      else
        format.html { render :edit }
        format.json { render json: @passeio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passeios/1
  # DELETE /passeios/1.json
  def destroy
    @passeio.destroy
    respond_to do |format|
      format.html { redirect_to passeios_url, notice: 'Seu passeio foi excluído!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passeio
      @passeio = Passeio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passeio_params
      params.require(:passeio).permit(:cachorro_1_id, :cachorro_2_id, :cachorro_3_id, :data_e_hora)
    end

end
