# frozen_string_literal: true
# 已完成

module Antlr4ruby

  class Vocabulary
    def initialize(literal_names, symbolic_names, display_names = [])
      super()
      @literal_names = literal_names || EMPTY_NAMES
      @symbolic_names = symbolic_names || EMPTY_NAMES
      @display_names = display_names || EMPTY_NAMES
      longer = literal_names.length > symbolic_names.length ? literal_names.length : symbolic_names.length
      @max_token_type = (longer > @display_names.length ? longer : @display_names.length) - 1
    end


    private
    EMPTY_NAMES = [].freeze

    attr_reader :literal_names, :symbolic_names,
                :display_names, :max_token_type

    public
    EMPTY_VOCABULARY = Vocabulary.new(EMPTY_NAMES, EMPTY_NAMES, EMPTY_NAMES)

    def get_literal_name(token_type)
      @literal_names[token_type]
    end

    def get_symbolic_name(token_type)
      return 'EOF' if token_type == Token::EOF

      @symbolic_names[token_type]
    end

    def get_display_name(token_type)
      @display_names[token_type] || get_literal_name(token_type) || get_symbolic_name(token_type) || token_type.to_s
    end

    def get_max_token_type
      @max_token_type
    end



    class << self
      def from_token_names(token_names)
        return EMPTY_VOCABULARY if !token_names || (token_names.length <= 0)

        literal_names = token_names.clone
        symbolic_names = token_names.clone
        (0..token_names.length).each do |i|
          token_name = token_names[i]
          next unless token_name

          unless token_name.empty?
            case token_name[0]
            when '\''
              symbolic_names[i] = nil
              next
            when /[A-Z]+/
              literal_names[i] = nil
              next
            end
          end
          literal_names[i] = nil
          symbolic_names[i] = nil
        end
        Vocabulary.new(literal_names, symbolic_names, token_names)
      end
    end
  end
end
