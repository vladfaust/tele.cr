require "json"

module Tele
  abstract class Type
    macro define_initializer(mapping)
      def initialize(
        {% for key, value in mapping %}
          {% default = value[:default] ? value[:default] : (value[:nilable] || "#{value[:type]}".includes?('?') || "#{value[:type]}".includes?("Nil") ? nil : false) %}
          @{{key.id}} : {{value[:type].id}}{{ '?'.id if value[:nilable] }}{{ " = #{default}".id if default != false }},
        {% end %}
      )
      end
    end

    macro define_hash_mapping(mapping)
      def to_h
        h = Hash(String, String?).new
        {% for key, value in mapping %}
          h[key] = @{{key.id}}.try &.to_s{{ " || #{value[:default]}.to_s".id if value[:default] }}
        {% end %}
        h
      end
    end

    macro mapping(mapping)
      define_initializer({{mapping}})
      define_hash_mapping({{mapping}})
      JSON.mapping({{mapping}})
    end
  end
end
