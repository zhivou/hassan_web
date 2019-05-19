class GeneratorsController < ApplicationController
  before_action :set_generator, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:create, :show, :new, :index]

  # GET /generators
  # GET /generators.json
  def index
    @generators = Generator.all
  end

  # GET /generators/1
  # GET /generators/1.json
  def show
  end

  # GET /generators/new
  def new
    @generator = Generator.new
  end

  # GET /generators/1/edit
  def edit
  end

  # POST /generators
  # POST /generators.json
  def create
    @generator = Generator.new(generator_params)

    respond_to do |format|
      if @generator.save
        format.html { redirect_to @generator, notice: 'Data was successfully submitted.' }
        format.json { render :show, status: :created, location: @generator }
        sent_to_worker(@generator)
      else
        format.html { render :new }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generators/1
  # PATCH/PUT /generators/1.json
  def update
    respond_to do |format|
      if @generator.update(generator_params)
        format.html { redirect_to @generator, notice: 'Data was successfully updated.' }
        format.json { render :show, status: :ok, location: @generator }
      else
        format.html { render :edit }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generators/1
  # DELETE /generators/1.json
  def destroy
    @generator.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_generator
    @generator = Generator.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def generator_params
    params.require(:generator).permit(:a_vol, :b_vol, :c_vol, :d_vol, :email, :first_name, :last_name, :note)
  end

  def sent_to_worker(params)
    job_container = {
        :id => params[:id],
        :parameter_1 => params[:a_vol],
        :parameter_2 => params[:b_vol],
        :parameter_3 => params[:c_vol],
        :parameter_4 => params[:d_vol],
        :email => params[:email],
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :note => params[:note],
        :created_at => params[:created_at],
        :updated_at => params[:updated_at]
    }

    HardWorker.perform_async(job_container)
  end
end
