module Views
  module Doctors
    class New < Components::Base
      def initialize(doctor:)
        @doctor = doctor
      end

      def view_template
        title "New doctor"

        div(class: "md:w-2/3 w-full") do
          h1(class: "font-bold text-4xl") { "New doctor" }

          render Views::Doctors::Form.new(doctor: @doctor)

          a(href: doctors_path, class: "w-full sm:w-auto text-center mt-2 sm:mt-0 sm:ml-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium") { "Back to doctors" }
        end
      end

      private

      def title(text)
        helpers.content_for(:title, text)
      end
    end
  end
end
