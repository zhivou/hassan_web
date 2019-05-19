class MechanicalPropsController < ApplicationController
  before_action :set_mechanical_prop, only: [:show, :edit, :update, :destroy]
  after_action :do_calculation, only: [:create]
  skip_before_action :authorize, only: [:create, :new, :show]
  skip_before_action :verify_authenticity_token

  # GET /mechanical_props
  # GET /mechanical_props.json
  def index
    @mechanical_props = MechanicalProp.includes(:calculation)
  end

  # GET /mechanical_props/1
  # GET /mechanical_props/1.json
  def show
  end

  # GET /mechanical_props/new
  def new
    @mechanical_prop = MechanicalProp.new
  end

  # GET /mechanical_props/1/edit
  def edit
  end

  # POST /mechanical_props
  # POST /mechanical_props.json
  #
  # @mechanical_prop.save is saving props into DB and returns true if successful and
  # false if not.
  #
  def create
    @mechanical_prop = MechanicalProp.new(mechanical_prop_params)

    respond_to do |format|
      if @mechanical_prop.save
        format.html { redirect_to @mechanical_prop, notice: 'Mechanical prop was successfully created.' }
        format.json { render :show, status: :created, location: @mechanical_prop }
        format.js { @calc_result = do_calculation }
      else
        #TODO Change rander new to render show and put error message for empty string
        format.html { render :new }
        format.json { render json: @mechanical_prop.errors, status: :unprocessable_entity }
        format.js { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /mechanical_props/1
  # PATCH/PUT /mechanical_props/1.json
  def update
    respond_to do |format|
      if @mechanical_prop.update(mechanical_prop_params)
        do_calculation
        format.html { redirect_to @mechanical_prop, notice: 'Mechanical prop was successfully updated.' }
        format.json { render :show, status: :ok, location: @mechanical_prop }
      else
        format.html { render :edit }
        format.json { render json: @mechanical_prop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mechanical_props/1
  # DELETE /mechanical_props/1.json
  def destroy
    @mechanical_prop.destroy
    respond_to do |format|
      format.html { redirect_to show_mechanical_props_url, notice: 'Mechanical prop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_mechanical_prop
    @mechanical_prop = MechanicalProp.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mechanical_prop_params
    params.require(:mechanical_prop).permit(:carbon, :structure)
  end

  ##
  # New Updated. Will calculate all 3 now + record it in DB
  #
  def do_calculation
    props = @mechanical_prop

    calc_result = {
        :hardness => 0,
        :yield_stress => 0,
        :tensile_stress => 0 }

    calc_result[:hardness] = ((0.01 * props.structure * 350) + (200 * props.carbon) + 185).round
    calc_result[:yield_stress] = ((3 * calc_result[:hardness]) - (0.01 * calc_result[:hardness]) - 260).round
    calc_result[:tensile_stress] = (2.87 * calc_result[:hardness]).round

    MechanicalProp.update_calculation(props, :hardness_hv, calc_result[:hardness])
    MechanicalProp.update_calculation(props, :proof_yield_stress, calc_result[:yield_stress])
    MechanicalProp.update_calculation(props, :tensile_stress, calc_result[:tensile_stress])
    calc_result
  end
end
