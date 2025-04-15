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
                TableRow(id: doctor.id) do
                  TableCell { Link(href: doctor_path(doctor), class: "px-0") { doctor.name }  }
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
                          AlertDialogTitle { "Quer realmente excluir?" }
                          AlertDialogDescription { "Essa ação não pode ser desfeita." }
                        end
                        AlertDialogFooter do
                          AlertDialogCancel { "Cancel" }
                          AlertDialogAction do
                            link_to(
                              "Continue",
                              doctor_path(doctor),
                              data: { "turbo-method": :delete }
                            )
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

      private

      def destructive_classes
        [
          "whitespace-nowrap inline-flex items-center justify-center rounded-md font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 bg-destructive text-destructive-foreground shadow-sm hover:bg-destructive/90",
          size_classes
        ]
      end

      def size_classes(size: :md, icon: false)
        if icon
          case size
          when :sm then "h-6 w-6"
          when :md then "h-9 w-9"
          when :lg then "h-10 w-10"
          when :xl then "h-12 w-12"
          end
        else
          case size
          when :sm then "px-3 py-1.5 h-8 text-xs"
          when :md then "px-4 py-2 h-9 text-sm"
          when :lg then "px-4 py-2 h-10 text-base"
          when :xl then "px-6 py-3 h-12 text-base"
          end
        end
      end
    end
  end
end
