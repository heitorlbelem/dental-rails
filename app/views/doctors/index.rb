module Views
  module Doctors
    class Index < Components::Base
      include Phlex::Rails::Helpers::LinkTo
      include Phlex::Rails::Helpers::ButtonTo

      def initialize(doctors:, notice: nil)
        @notice = notice
        @doctors = doctors
      end

      def view_template
        div(class: "flex flex-col gap-8 w-full") do
          Heading(level: 1)  { "Dentistas" }

          if @notice.present?
            Alert(variant: :warning) do
              AlertTitle { @notice }
            end
          end

          Link(href: new_doctor_path, variant: :primary, data: { turbo_frame: "remote_modal" }) do
            "Novo dentista"
          end

          Table do
            TableHeader do
              TableRow do
                TableHead { "Nome" }
                TableHead { "Expertise" }
                TableHead {  }
              end
            end
            TableBody do
              @doctors.each do |doctor|
                TableRow do
                  TableCell { Link(href: doctor_path(doctor)) { doctor.name }  }
                  TableCell { doctor.expertise }
                  TableCell do
                    Link(href: edit_doctor_path(doctor), variant: :primary, data: { turbo_frame: "remote_modal" }) do
                      "Editar"
                    end
                    button_to("delete", @recipe, method: :delete, class: "whitespace-nowrap inline-flex items-center justify-center rounded-md font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 bg-destructive text-primary-foreground shadow hover:bg-primary/90 px-4 py-2 h-9 text-sm")
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
