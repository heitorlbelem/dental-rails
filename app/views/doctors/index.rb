module Views
  module Doctors
    class Index < Components::Base
      def initialize(doctors:)
        @doctors = doctors
      end

      def view_template
        div(class: "flex flex-col gap-8 w-full") do
          Heading(level: 1)  { "Dentistas" }

          Table do
            TableHeader do
              TableRow do
                TableHead { "Nome" }
                TableHead { "Expertise" }
              end
            end
            TableBody do
              @doctors.each do |doctor|
                TableRow do
                  TableCell { Link(href: doctor_path(doctor)) { doctor.name }  }
                  TableCell { doctor.expertise }
                end
              end
            end
          end

          Link(href: new_doctor_path, variant: :primary, icon: true) do
            "+"
          end
        end
      end
    end
  end
end
