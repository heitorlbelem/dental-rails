class DoctorsController < ApplicationController
  layout "modal", only: [ :new, :edit ]
  before_action :set_doctor, only: %i[ show edit update destroy ]

  def index
    render Views::Doctors::Index.new(doctors: Doctor.all, notice: notice)
  end

  def show
    render Views::Doctors::Show.new(doctor: @doctor, notice: notice)
  end

  def new
    @doctor = Doctor.new
    render Views::Doctors::New.new(doctor: @doctor)
  end

  def edit
    render Views::Doctors::Edit.new(doctor: @doctor)
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_path, notice: "Teste"
    else
      render Views::Doctors::New.new(doctor: @doctor), status: :unprocessable_entity
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: "Dentista atualizado"
    else
      render Views::Doctors::Edit.new(doctor: @doctor), status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy!

    redirect_to doctors_path, status: :see_other, notice: "Dentista excluído com sucesso"
  end

  private

  def set_doctor
    @doctor = Doctor.find(params.expect(:id))
  end

  def doctor_params
    params.expect(doctor: [ :name, :expertise ])
  end
end
