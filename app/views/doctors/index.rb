module Views
  module Doctors
    class Index < Components::Base
      def initialize(doctors:)
        @doctors = doctors
      end

      def view_template
        div(class: "flex flex-col gap-8 w-full") do
          h1(class: "font-bold text-4xl") { "Doctors" }

          Table(class: "w-full") do
            TableHeader do
              TableRow do
                TableHead { "Name" }
                TableHead(class: "text-right") { "Expertise" }
              end
            end
            TableBody do
              @doctors.each do |doctor|
                TableRow do
                  TableCell { doctor.name }
                  TableCell(class: "text-right") { doctor.expertise }
                end
              end
            end
          end

          Link(
            href: new_doctor_path,
            class: "w-full sm:w-auto text-center rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium"
          ) do
            "New doctor"
          end
        end
      end
    end
  end
end
