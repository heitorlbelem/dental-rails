class DoctorsController < ApplicationController
  layout "modal", only: %i[new edit create update]
  before_action :set_doctor, only: %i[ show edit update destroy ]

  def index
    render Views::Doctors::Index.new(doctors: Doctor.all, flash: flash)
  end

  def show
    render Views::Doctors::Show.new(doctor: @doctor, notice: notice)
  end

  def new
    render Views::Doctors::New.new(doctor: Doctor.new)
  end

  def edit
    render Views::Doctors::Edit.new(doctor: @doctor)
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_path, flash: { success: I18n.t("models.doctor.messages.created") }
    else
      render turbo_stream: turbo_stream.replace(:doctor_form, Views::Doctors::New.new(doctor: @doctor)), status: :unprocessable_entity
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, flash: { warning: I18n.t("models.doctor.messages.updated") }
    else
      render turbo_stream: turbo_stream.replace(:doctor_form, Views::Doctors::Edit.new(doctor: @doctor)), status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy!

    render turbo_stream: turbo_stream.remove("doctor-line-#{@doctor.id}")
  end

  private

  def set_doctor
    @doctor = Doctor.find(params.expect(:id))
  end

  def doctor_params
    params.expect(doctor: [ :name, :expertise ])
  end
end
