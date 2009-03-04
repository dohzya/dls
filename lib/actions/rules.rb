#!/usr/bin/env ruby

# author: dohzya
# licence: GPLv3

module DLS
  module Actions
    module Rules
      class Rule < ::Proc
        def & other
          Rule.new {|f,a| self.call(f,a) && other.call(f,a)}
        end
        def | other
          Rule.new {|f,a| self.call(f,c) || other.call(f,a)}
        end
        def -@
          Rule.new {|f,a| !self.call(f,a)}
        end
      end

      True     = Rule.new {|f,a| true}
      Input    = Rule.new {|f,a| Tests::IO.stdin?}
      Output   = Rule.new {|f,a| Tests::IO.tty?}
      File     = Rule.new {|f,a| f}
      TextFile = File & Rule.new {|f,a| Tests::FileType.text? f}
      CompressedFile = File & Rule.new {|f,a| Tests::FileType.compressed? f}
      BinaryFile = File & Rule.new {|f,a| Tests::FileType.binary? f}

    end
  end
end

