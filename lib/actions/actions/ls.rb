#!/usr/bin/env ruby

# author: dohzya
# licence: GPLv3

module DLS::Actions
  class Ls < Action
    Rule = -Rules::Input
    Opts = Config.ls.options
    Cmd  = 'ls'
    private
    def merge_options opts
      res = super
    end
    public
    def cmd( file, args )
      build_cmd Cmd, args, file
    end
  end
end

