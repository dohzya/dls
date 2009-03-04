#!/usr/bin/env ruby

# author: dohzya
# licence: GPLv3

here = here_dir __FILE__
require here/'rules'

module DLS
  module Actions
    class Action
      private
      def merge_options opts
        res = default_options.dup
        opts = opts.dup
        while opt = opts.shift
          case opt
          when /--dls-clear-options/
            res.clear
          else
            res << opt
          end
        end
        res
      end
      def build_cmd *args
        args.flatten
      end
      public
      def call file, args
        m = respond_to? :merge_options ? :merge_options : merge_options_generic
          System::Call cmd( file, send(m, args) )
      end
    end
  end
end

Dir['actions/**/*.rb'].each {|action| require action}
