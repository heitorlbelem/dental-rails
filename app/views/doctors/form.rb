module Views
  module Doctors
    class Form < Components::Base
      include Phlex::Rails::Helpers::FormWith

      def initialize(doctor:)
        @doctor = doctor
      end

      def view_template
        div(class: "space-y-6 w-full") do
          form_with(model: @doctor, class: "contents") do |form|
            div(class: "my-5") do
              form.label(:name, class: "block text-sm font-medium leading-6 text-gray-900")
              div(class: "mt-2") do
                form.text_field(:name,
                  class: [
                    "block w-full rounded-md border-0 py-1.5 px-3 text-gray-900 shadow-sm ring-1 ring-inset placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6",
                    {
                      "ring-gray-300 focus:ring-blue-600": @doctor.errors[:name].empty?,
                      "ring-red-300 focus:ring-red-600": @doctor.errors[:name].any?
                    }
                  ]
                )
              end
              if @doctor.errors[:name].any?
                div(class: "mt-2 text-sm text-red-600") do
                  @doctor.errors[:name].join(", ")
                end
              end
            end

            div(class: "my-5") do
              form.label(:expertise, class: "block text-sm font-medium leading-6 text-gray-900")
              div(class: "mt-2") do
                form.text_field(:expertise,
                  class: [
                    "block w-full rounded-md border-0 py-1.5 px-3 text-gray-900 shadow-sm ring-1 ring-inset placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6",
                    {
                      "ring-gray-300 focus:ring-blue-600": @doctor.errors[:expertise].empty?,
                      "ring-red-300 focus:ring-red-600": @doctor.errors[:expertise].any?
                    }
                  ]
                )
              end
              if @doctor.errors[:expertise].any?
                div(class: "mt-2 text-sm text-red-600") do
                  @doctor.errors[:expertise].join(", ")
                end
              end
            end

            div(class: "mt-6 flex items-center justify-start gap-x-4") do
              button(
                type: "submit",
                class: "rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600"
              ) do
                @doctor.persisted? ? "Update Doctor" : "Create Doctor"
              end
            end
          end
        end
      end
    end
  end
end
