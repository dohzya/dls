#!/usr/bin/env ruby

# author: dohzya
# licence: GPLv3

module DLS
  module Actions
    class Colorer
      Rule = Rules::Input & Rules::Output & Rules::TextFile
    end
  end
end

