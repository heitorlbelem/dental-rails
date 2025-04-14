module Views
  module Doctors
    class Edit < Components::Base
      def initialize(doctor:)
        @doctor = doctor
      end

      def view_template
        render Views::Doctors::Form.new(doctor: @doctor, title: "Editar dentista")
      end

      private

      def title(text)
        helpers.content_for(:title, text)
      end
    end
  end
end
