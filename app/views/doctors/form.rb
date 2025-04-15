module Views
  module Doctors
    class Form < Components::Base
      include Phlex::Rails::Helpers::FormWith

      def initialize(doctor:, title:)
        @doctor = doctor
        @title = title
        @persisted = doctor.persisted?
      end

      def view_template
        Dialog(open: true, id: "doctor_form") do
          DialogContent do
            DialogHeader do
              DialogTitle { @title }
            end
            DialogMiddle do
              Form(action: form_url, method: @persisted ? :patch : :post) do
                FormFieldFor(object: @doctor, field: :name)
                FormFieldFor(object: @doctor, field: :expertise)
                Button(type: "submit") do
                  @persisted ? "Atualizar" : "Criar"
                end
              end
            end
          end
        end
      end

      private

      def form_url
        if @persisted
          doctor_path(@doctor)
        else
          doctors_path
        end
      end

      def form_method
        if @persisted
          :put
        else
          :post
        end
      end
    end
  end
end
