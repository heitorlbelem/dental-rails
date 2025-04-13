module Views
  module Doctors
    class Show < Components::Base
      def initialize(doctor:, notice: nil)
        @doctor = doctor
        @notice = notice
      end

      def view_template
        title "Showing doctor"

        div(class: "md:w-2/3 w-full") do
          if @notice.present?
            p(class: "py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-md inline-block", id: "notice") { @notice }
          end

          h1(class: "font-bold text-4xl") { "Showing doctor" }

          render Views::Doctors::Doctor.new(doctor: @doctor)

          a(href: helpers.edit_doctor_path(@doctor), class: "w-full sm:w-auto text-center rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium") { "Edit this doctor" }
          a(href: helpers.doctors_path, class: "w-full sm:w-auto text-center mt-2 sm:mt-0 sm:ml-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium") { "Back to doctors" }

          form(action: helpers.doctor_path(@doctor), method: "post", class: "sm:inline-block mt-2 sm:mt-0 sm:ml-2") do
            input(type: "hidden", name: "_method", value: "delete")
            input(type: "hidden", name: "authenticity_token", value: helpers.form_authenticity_token)
            button(type: "submit",
              class: "w-full rounded-md px-3.5 py-2.5 text-white bg-red-600 hover:bg-red-500 font-medium cursor-pointer",
              data: { turbo_confirm: "Are you sure?" }) { "Destroy this doctor" }
          end
        end
      end

      private

      def title(text)
        helpers.content_for(:title, text)
      end
    end
  end
end
