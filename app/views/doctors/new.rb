module Views
  module Doctors
    class New < Components::Base
      def initialize(doctor:)
        @doctor = doctor
      end

      def view_template
        render Views::Doctors::Form.new(doctor: @doctor, title: "Novo dentista")
      end
    end
  end
end
