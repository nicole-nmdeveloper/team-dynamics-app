class DinamicasController < ApplicationController
  before_action :set_dinamica, only: %i[ show edit update destroy ]

  # GET /dinamicas or /dinamicas.json
  def index
    @dinamicas = Dinamica.all
  end

  # GET /dinamicas/1 or /dinamicas/1.json
  def show
  end

  # GET /dinamicas/1 or /dinamicas/1.json
  def random
    @dinamica = Dinamica.order("RANDOM()").first
  end

  # GET /dinamicas/new
  def new
    @dinamica = Dinamica.new
  end

  # GET /dinamicas/1/edit
  def edit
  end

  # POST /dinamicas or /dinamicas.json
  def create
    @dinamica = Dinamica.new(dinamica_params)

    respond_to do |format|
      if @dinamica.save
        format.html { redirect_to @dinamica, notice: "Dinamica was successfully created." }
        format.json { render :show, status: :created, location: @dinamica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dinamica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinamicas/1 or /dinamicas/1.json
  def update
    respond_to do |format|
      if @dinamica.update(dinamica_params)
        format.html { redirect_to @dinamica, notice: "Dinamica was successfully updated." }
        format.json { render :show, status: :ok, location: @dinamica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dinamica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinamicas/1 or /dinamicas/1.json
  def destroy
    @dinamica.destroy!

    respond_to do |format|
      format.html { redirect_to dinamicas_path, status: :see_other, notice: "Dinamica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinamica
      @dinamica = Dinamica.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dinamica_params
      params.expect(dinamica: [ :nome, :descricao ])
    end
end
