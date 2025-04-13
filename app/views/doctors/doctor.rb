module Views
  module Doctors
    class Doctor < Components::Base
      def initialize(doctor:)
        @doctor = doctor
      end

      def view_template
        div(id: helpers.dom_id(@doctor), class: "w-full bg-white overflow-hidden shadow sm:rounded-lg") do
          div(class: "px-4 py-5 sm:px-6") do
            h3(class: "text-lg leading-6 font-medium text-gray-900") do
              "Doctor Information"
            end
          end

          div(class: "border-t border-gray-200") do
            dl do
              div(class: "bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6") do
                dt(class: "text-sm font-medium text-gray-500") do
                  "Name"
                end
                dd(class: "mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0") do
                  @doctor.name
                end
              end

              div(class: "bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6") do
                dt(class: "text-sm font-medium text-gray-500") do
                  "Expertise"
                end
                dd(class: "mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0") do
                  @doctor.expertise
                end
              end
            end
          end
        end
      end
    end
  end
end
