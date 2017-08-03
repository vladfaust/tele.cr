module Tele
  module Types
    module Macros
      macro define_initializer(mapping)
        def initialize(
          {% for key, value in mapping %}
            {% default = value[:default] ? value[:default] : (value[:nilable] || "#{value[:type]}".includes?('?') || "#{value[:type]}".includes?("Nil") ? nil : false) %}
            @{{key.id}} : {{value[:type].id}}{{ '?'.id if value[:nilable] }}{{ " = #{default}".id if default != false }},
          {% end %}
        )
        end
      end
    end
  end
end
