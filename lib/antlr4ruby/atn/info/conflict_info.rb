# finished
# frozen_string_literal: true



module Antlr4ruby
  class ConflictInfo

    def initialize(conflicted_alts, exact)
      @conflicted_alts, @exact = conflicted_alts, exact
    end

    private
    attr_accessor :conflicted_alts, :exact

    public
    def get_conflicted_alts
      @conflicted_alts
    end

    def is_exact?
      @exact
    end

    def eql?(other)
      return true if self.equal?(other)

      return false unless other.kind_of?(ConflictInfo)
      @exact == other.exact && conflicted_alts.eql?(other.conflicted_alts)
    end

    def hash
      conflicted_alts.hash
    end


  end
end

