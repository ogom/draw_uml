require_relative 'tree/leaf'
require_relative 'tree/branch'

module DrawUml
  module Tree
    def self.create(path)
      DrawUml::Tree::Branch.new(path)
    end
  end
end
