module DrawUml
  module Tree
    class Leaf
      attr_reader :name, :path

      def initialize(name)
        @name = File.basename(name, '.*')
        @path = File.expand_path(name)
      end
    end
  end
end
