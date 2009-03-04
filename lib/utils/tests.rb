#!/usr/bin/env ruby

# author: dohzya
# licence: GPLv3

require 'fcntl'

module DLS
  module Tests
    module IO
      def self.stdin?
        STDIN.fcntl(Fcntl::F_GETFL, 0).zero?
      end
      def self.tty?
        STDOUT.isatty
      end
    end

    module FileType
      class << self
        @@ft = {}
        def file_type( file )
          @@ft[file] ||= System::Call.new('file','-b', '-L', '-z', file).stdout.readline
        end
        def text? file
          file_type(file) =~ /text/
        end
        def compressed? file
          file_type(file).match( /([-a-zA-Z0-9.]*) compressed/ )[1]
        end
        def binary? file
          file_type(file) =~ /data/
        end
      end
    end
  end
end
