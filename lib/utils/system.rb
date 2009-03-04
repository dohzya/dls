#!/usr/bin/env ruby

# author: dohzya
# licence: GPLv3

require 'open3'

module DLS
  module System
    class Call
      attr_reader :stdin, :stdout, :stderr
      def initialize cmd, *args
        @stdin, @stdout, @stderr = Open3.popen3(cmd, *args)
      end
    end
  end
end
