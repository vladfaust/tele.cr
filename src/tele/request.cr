require "./client"

module Tele
  abstract class Request(CastResponseTo)
    @@empty_body = true

    def send(token : String)
      Client.new(token).make_request(@@method, (self unless @@empty_body), cast_to: CastResponseTo)
    end

    macro define_hash_mapping(mapping)
      def to_h
        h = Hash(String, String?).new
        {% for key, value in mapping %}
          h["{{key}}"] = @{{key.id}}.try &.to_s{{ " || #{value[:default]}.to_s".id if value[:default] }}
        {% end %}
        h["method"] = @@method
        h
      end
    end

    macro map(mapping)
      JSON.mapping(
        {% for key, value in mapping %}
          {{key.id}}: {{value.id}},
        {% end %}
          method: {type: String},
      )

      @@empty_body = false

      def initialize(
        {% for key, value in mapping %}
          {% default = value[:default] ? value[:default] : (value[:nilable] || "#{value[:type]}".includes?('?') || "#{value[:type]}".includes?("Nil") ? nil : false) %}
          @{{key.id}} : {{value[:type].id}}{{ '?'.id if value[:nilable] }}{{ " = #{default}".id if default != false }},
        {% end %}
          @method = @@method
      )
      end

      define_hash_mapping({{mapping}})
    end

    macro inherited
      @@method : String = {{@type.name}}.to_s.split(":").last.sub &.downcase
    end
  end
end
