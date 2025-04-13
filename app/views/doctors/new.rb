module Views
  module Doctors
    class New < Components::Base
      def initialize(doctor:)
        @doctor = doctor
      end

      def view_template
        div(class: "w-full") do
          Heading(level: 1)  { "Cadastrar dentista" }

          render Views::Doctors::Form.new(doctor: @doctor)

          Link(href: doctors_path) { "Voltar" }
        end
      end
    end
  end
end
