# frozen_string_literal: true

module Components
  class FormFieldFor < Phlex::HTML
    include RubyUI

    def initialize(object:, field:)
      @object = object
      @model_name = object.model_name.singular
      @field = field
    end

    def view_template
      FormField do
        FormFieldLabel { I18n.t(@field, scope: [ :models, @model_name, :attributes ]) }
        Input(name: "#{@model_name}[#{@field}]", value: @object.try(&@field))
        if @object.errors[@field].any?
          FormFieldError {  @object.errors[@field].join(", ") }
        end
      end
    end
  end
end
