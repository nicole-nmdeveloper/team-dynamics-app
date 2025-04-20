class DinamicasController < ApplicationController
  before_action :set_dinamica, only: %i[ show edit update destroy ]

  # GET /dinamicas or /dinamicas.json
  def index
    @dinamicas = Dinamica.includes(:reviews).all
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
    @dinamica.reviews.build
  end

  # GET /dinamicas/1/edit
  def edit
  end

  # POST /dinamicas or /dinamicas.json
  def create
    @dinamica = Dinamica.new(dinamica_params)

    respond_to do |format|
      if @dinamica.save
        Rails.logger.info "Dinâmica criada com sucesso: #{@dinamica.inspect}"

        format.html { redirect_to @dinamica, notice: "A dinâmica foi cadastrada." }
        format.json { render :show, status: :created, location: @dinamica }
      else
        Rails.logger.error "Erro ao criar dinâmica: #{@dinamica.errors.full_messages.join(', ')}"
        
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dinamica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinamicas/1 or /dinamicas/1.json
  def update
    respond_to do |format|
      if @dinamica.update(dinamica_params)
        Rails.logger.info "Dinâmica atualizada com sucesso: #{@dinamica.inspect}"

        format.html { redirect_to @dinamica, notice: "A dinâmica foi atualizada." }
        format.json { render :show, status: :ok, location: @dinamica }
      else
        Rails.logger.error "Erro ao atualizar dinâmica: #{@dinamica.errors.full_messages.join(', ')}"

        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dinamica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinamicas/1 or /dinamicas/1.json
  def destroy
    @dinamica.destroy!

    respond_to do |format|
      Rails.logger.info "Dinâmica apagada com sucesso: #{@dinamica.inspect}"
      format.html { redirect_to dinamicas_path, status: :see_other, notice: "A dinâmica foi apagada." }
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
      params.require(:dinamica).permit(
        :nome,
        :descricao,
        reviews_attributes: [:id, :comentario, :nota, :data_criacao ]
      )
    end
end
