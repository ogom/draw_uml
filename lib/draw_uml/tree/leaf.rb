module DrawUml
  module Tree
    class Leaf
      attr_reader :name, :path, :level

      def initialize(name, level=0)
        @name = File.basename(name, '.*')
        @path = File.expand_path(name)
        @level = level
      end

      def leaf?
        true
      end
    end
  end
end
