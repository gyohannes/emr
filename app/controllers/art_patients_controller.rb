class ArtPatientsController < ApplicationController
  before_action :set_art_patient, only: [:show, :edit, :update, :destroy]

  # GET /art_patients
  # GET /art_patients.json
  def index
    @art_patients = []
  end

  def load_referral
    @referred_from = params[:referred_from]
    @departments = Department.all
    render partial: 'referred_from'
  end

  def load_patients
    @art_patients = []
    mrn = params[:mrn]
    art_number = params[:art_number]
    first_name = params[:first_name]
    father_name = params[:father_name]
    grand_father_name = params[:grand_father_name]
    phone_number = params[:phone_number]
    gender = params[:gender]
    age = params[:age]
    @art_patients = Patient.search(mrn, art_number, phone_number, age, gender,first_name, father_name, grand_father_name)
    render partial: 'art_patients'
  end

  def create_from_search
    @art_patient  = ArtPatient.new(enrollment_date: Date.today)
    @art_patient.build_patient(first_name: params[:art_patient_search][:first_name],
                           father_name: params[:art_patient_search][:father_name],
                           grand_father_name: params[:art_patient_search][:grand_father_name],
                           mobile_telephone: params[:art_patient_search][:phone_number], gender: params[:art_patient_search][:phone_number],
                               age: {}
    )
    @art_patient.build_referral
    @art_patient.build_care_giver
    render 'new'
  end

  # GET /art_patients/1
  # GET /art_patients/1.json
  def show
  end

  # GET /art_patients/new
  def new
    patient = Patient.find(params[:patient])
    @art_patient = patient.build_art_patient
    @art_patient.save(validate: false)
    redirect_to edit_art_patient_path(@art_patient)
  end

  # GET /art_patients/1/edit
  def edit
    @art_patient.build_care_giver if @art_patient.care_giver.blank?
    @art_patient.build_referral if @art_patient.referral.blank?
    @referred_from = @art_patient.referral.try(:referred_from)
  end

  # POST /art_patients
  # POST /art_patients.json
  def create
    @art_patient = ArtPatient.new(art_patient_params)
    @referred_from = @art_patient.referral.referred_from
    respond_to do |format|
      if @art_patient.save
        format.html { redirect_to @art_patient, notice: 'Art patient was successfully created.' }
        format.json { render :show, status: :created, location: @art_patient }
      else
        format.html { render :new }
        format.json { render json: @art_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_patients/1
  # PATCH/PUT /art_patients/1.json
  def update
    @referred_from = @art_patient.referral.try(:referred_from)
    respond_to do |format|
      if @art_patient.update(art_patient_params)
        format.html { redirect_to @art_patient, notice: 'Art patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_patient }
      else
        format.html { render :edit }
        format.json { render json: @art_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_patients/1
  # DELETE /art_patients/1.json
  def destroy
    @art_patient.destroy
    respond_to do |format|
      format.html { redirect_to art_patients_url, notice: 'Art patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_patient
      @art_patient = ArtPatient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_patient_params
      params.require(:art_patient).permit(:patient_id, :enrollment_date, :unique_art_number,
                                          :target_population_category, :mother_name, :mother_father_name, :mother_grand_father_name,
                                          :place_of_delivery, :mode_of_delivery, :care_giver_marital_status,
                                          patient_attributes: [:id, :mrn, :first_name, :father_name, :grand_father_name, :gender, :date_of_birth,
                                          :religion, :education_level, :occupation, :marital_status,
                                          :organization_structure_id, :residence_type, :kebele,:house_number, :home_telephone, :mobile_telephone,
                                          :work_telephone, :catchment_area, :followup_challenge, age: {} ],
                                          dependents_attributes: [:id, :name, :relation, :age, :health_status, :_destroy ],
                                          referral_attributes: [:id, :referred_from, :department_id, :outside_referral_type, :_destroy],
                                          care_giver_attributes: [:id, :full_name, :age, :gender, :relation, :address_same_as_patient,
                                          :organization_structure_id, :kebele, :house_number, :home_telephone, :mobile_telephone, :work_telephone])
    end
end
