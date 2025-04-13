class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ]

  # GET /doctors or /doctors.json
  def index
    render Views::Doctors::Index.new(doctors: Doctor.all)
  end

  # GET /doctors/1 or /doctors/1.json
  def show
    respond_to do |format|
      format.html { render Views::Doctors::Show.new(doctor: @doctor, notice: notice) }
      format.json { render :show }
    end
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
    render Views::Doctors::New.new(doctor: @doctor)
  end

  # GET /doctors/1/edit
  def edit
    render Views::Doctors::Edit.new(doctor: @doctor)
  end

  # POST /doctors or /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: "Doctor was successfully created." }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render Views::Doctors::New.new(doctor: @doctor), status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render Views::Doctors::Edit.new(doctor: @doctor), status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1 or /doctors/1.json
  def destroy
    @doctor.destroy!

    respond_to do |format|
      format.html { redirect_to doctors_path, status: :see_other, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.expect(doctor: [ :name, :expertise ])
    end
end
