module Views
  module Doctors
    class Form < Components::Base
      include Phlex::Rails::Helpers::FormWith

      def initialize(doctor:)
        @doctor = doctor
        @persisted = doctor.persisted?
      end

      def view_template
        Form(action: @persisted ? doctor_path(@doctor) : doctors_path, method: @persisted ? :patch : :post) do
          FormField do
            FormFieldLabel { "Nome" }
            Input(name: "doctor[name]", value: @doctor&.name)
            if @doctor.errors[:name].any?
              FormFieldError {  @doctor.errors[:name].join(", ") }
            end
          end

          FormField do
            FormFieldLabel { "Expertise" }
            Input(name: "doctor[expertise]", value: @doctor&.expertise)
            if @doctor.errors[:expertise].any?
              FormFieldError {  @doctor.errors[:expertise].join(", ") }
            end
          end

          Button(type: "submit", variant: :primary) do
            @persisted ? "Atualizar" : "Criar"
          end
        end
      end
    end
  end
end
