# frozen_string_literal: true

module Components
  class AlertContainer < Phlex::HTML
    include RubyUI

    def initialize(flash:)
      @flash = flash
    end

    def view_template
      @flash.each do |key, value|
        Alert(variant: key.to_sym) do
          AlertTitle { value }
        end
      end
    end
  end
end
