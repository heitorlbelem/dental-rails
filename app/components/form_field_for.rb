# frozen_string_literal: true

class FormFieldFor < Phlex::HTML
  def initialize(object:, field:)
    @object = object
    @field = field
  end

  def view_template
    FormField do
      FormFieldLabel { I18n.t(".test") }
      Input(name: "#{@object.name}[#{@field}]", value: @object.try(&@field))
      if @object.errors[@field].any?
        FormFieldError {  @object.errors[@field].join(", ") }
      end
    end
  end
end
