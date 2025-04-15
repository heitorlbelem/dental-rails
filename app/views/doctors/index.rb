module Views
  module Doctors
    class Index < Components::Base
      include Phlex::Rails::Helpers::LinkTo
      include Phlex::Rails::Helpers::ButtonTo

      def initialize(doctors:, flash: nil)
        @doctors = doctors
        @flash = flash
      end

      def view_template
        div(class: "w-full gap-4 flex flex-col") do
          AlertContainer(flash: @flash)

          div(class: "flex justify-between items-center") do
            Heading(level: 1)  { "Dentistas" }
            Link(href: new_doctor_path, variant: :primary, data: { turbo_frame: "remote_modal" }) do
              "Novo dentista"
            end
          end

          Table do
            TableHeader do
              TableRow do
                TableHead { "Nome" }
                TableHead { "Expertise" }
                TableHead { "Criado em" }
                TableHead { "Atualizado em" }
                TableHead(class: "text-right") {  }
              end
            end
            TableBody do
              @doctors.each do |doctor|
                TableRow do
                  TableCell { Link(href: doctor_path(doctor), class: 'px-0') { doctor.name }  }
                  TableCell { doctor.expertise }
                  TableCell { I18n.l(doctor.created_at) }
                  TableCell { I18n.l(doctor.updated_at) }
                  TableCell(class: "text-right") do
                    Link(href: edit_doctor_path(doctor), variant: :primary, data: { turbo_frame: "remote_modal" }) do
                      "Editar"
                    end
                    AlertDialog do
                      AlertDialogTrigger do
                        Button(variant: :secondary) { "Excluir" }
                      end
                      AlertDialogContent do
                        AlertDialogHeader do
                          AlertDialogTitle { "Are you absolutely sure?" }
                          AlertDialogDescription { "This action cannot be undone. This will permanently delete your account and remove your data from our servers." }
                        end
                        AlertDialogFooter do
                          AlertDialogCancel { "Cancel" }
                          AlertDialogAction { "Continue" } # Will probably be a link to a controller action (e.g. delete account)
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
    end
  end
end
