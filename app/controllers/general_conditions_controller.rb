class GeneralConditionsController < ApplicationController
  before_action :set_general_condition, only: [:show, :edit, :update, :destroy]

  # GET /general_conditions
  # GET /general_conditions.json
  def index
    @general_conditions = GeneralCondition.all
  end

  # GET /general_conditions/1
  # GET /general_conditions/1.json
  def show
  end

  # GET /general_conditions/new
  def new
    @general_condition = GeneralCondition.new(vital_signs_anrtopometry_and_functional_level: {vital_signs: {}, anrtopometry: {}, functional_status: nil},
                                              pregnancy_status: {})
    ['HEENT','Lymph nodes','Chest','Heart','Abdomen','Genitourinary System','Musculo-skeletal System','Skin','Nervous System' ].each do |pe|
      @general_condition.physical_exams.build(physical_exam: pe)
    end
  end

  # GET /general_conditions/1/edit
  def edit
  end

  # POST /general_conditions
  # POST /general_conditions.json
  def create
    @general_condition = GeneralCondition.new(general_condition_params)

    respond_to do |format|
      if @general_condition.save
        format.html { redirect_to @general_condition, notice: 'General condition was successfully created.' }
        format.json { render :show, status: :created, location: @general_condition }
      else
        format.html { render :new }
        format.json { render json: @general_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_conditions/1
  # PATCH/PUT /general_conditions/1.json
  def update
    respond_to do |format|
      if @general_condition.update(general_condition_params)
        format.html { redirect_to @general_condition, notice: 'General condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_condition }
      else
        format.html { render :edit }
        format.json { render json: @general_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_conditions/1
  # DELETE /general_conditions/1.json
  def destroy
    @general_condition.destroy
    respond_to do |format|
      format.html { redirect_to general_conditions_url, notice: 'General condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_condition
      @general_condition = GeneralCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_condition_params
      params.require(:general_condition).permit(:date, :art_patient_id, :vital_signs_anrtopometry_and_functional_level, :symptom_screen, :pregnancy_status, :physical_exam)
    end
end
