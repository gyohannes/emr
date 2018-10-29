class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = []
  end

  def load_patients
    @art_patients = []
    mrn = params[:mrn]
    first_name = params[:first_name]
    father_name = params[:father_name]
    grand_father_name = params[:grand_father_name]
    phone_number = params[:phone_number]
    age = params[:age]
    @art_patients = Patient.search(mrn, art_number, phone_number, age, gender,first_name, father_name, grand_father_name)
    render partial: 'art_patients'
  end

  def create_from_search
    @patient = Patient.new(first_name: params[:patient_search][:first_name],
                           father_name: params[:patient_search][:father_name],
                           grand_father_name: params[:patient_search][:grand_father_name],
                           mobile_telephone: params[:patient_search][:phone_number]
    )
    4.times do
      @patient.relatives.build
    end
    render 'new'
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    4.times do
      @patient.relatives.build
    end
  end

  # GET /patients/1/edit
  def edit
    (3).times do
      @patient.relatives.build
    end
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:MRN, :first_name, :father_name, :grand_father_name,
                                      :mother_first_name, :gender, :date_of_birth, :years, :months, :days,
                                      :religion, :education_level, :occupation, :marital_status,
                                      :organization_structure_id,:kebele, :house_number, :home_telephone, :mobile_telephone, :work_telephone,
                                      relatives_attributes: [:id, :name, :relationship, :phone, :_destroy])
    end
end
