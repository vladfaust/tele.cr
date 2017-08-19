require "./client"

module Tele
  abstract class Request(CastResponseTo)
    def send(token : String)
      Client.new(token).request(@@method, self.to_h, cast_to: CastResponseTo)
    end

    macro define_hash_mapping(mapping)
      def to_h
        h = Hash(String, String | File).new
        {% for key, value in mapping %}
          h["{{key}}"] = case @{{key.id}}
          when Tele::Type
            @{{key.id}}.as(Tele::Type).to_json
          when File
            @{{key.id}}.as(File)
          when Array(Tele::Types::InlineQueryResult)
            "[" + (@{{key.id}}.as(Array(Tele::Types::InlineQueryResult)).map &.as(Tele::Type).to_json).join(",") + "]"
          else
            (@{{key.id}} || {{value[:default].id}}).to_s
          end
        {% end %}
        h["method"] = @@method
        h
      end
    end

    macro define_initializer(mapping)
      def initialize(
        {% for key, value in mapping %}
          {% default = value[:default] ? value[:default] : (value[:nilable] || "#{value[:type]}".includes?('?') || "#{value[:type]}".includes?("Nil") ? nil : false) %}
          {% possible_file_variables << key if "#{value[:type]}".includes?("InputFile") %}
          @{{key.id}} : {{value[:type].id}}{{ '?'.id if value[:nilable] }}{{ " = #{default}".id if default != false }},
        {% end %}
          @method = @@method
      )
      end
    end

    macro map(mapping)
      JSON.mapping(
        {% for key, value in mapping %}
          {{key.id}}: {{value.id}},
        {% end %}
          method: {type: String},
      )

      define_initializer({{mapping}})
      define_hash_mapping({{mapping}})
    end

    macro inherited
      @@method : String = {{@type.name}}.to_s.split(":").last.sub &.downcase
    end
  end
end
