module DrawUml
  module Tree
    class Leaf
      attr_reader :name, :path, :level, :trunk, :id

      def initialize(path, level=0, trunk=nil)
        @name = File.basename(path, '.*')
        @path = File.expand_path(path)

        if trunk.nil?
          @level = level
          @trunk = path
        else
          @level = level + 1
          @trunk = trunk
          @id = "#{File.dirname(@path)}/#{@name}".sub(trunk, '')
        end
      end

      def leaf?
        true
      end
    end
  end
end
