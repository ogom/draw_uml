module DrawUml
  module Tree
    class Leaf
      attr_reader :name, :path, :level, :id

      def initialize(name, level=0)
        @name = File.basename(name, '.*')
        @path = File.expand_path(name)
        @level = level

        raw = path.sub(DrawUml::Configure.source_path, '')
        @id = raw.sub('.' + DrawUml::Configure.diagram_extension, '')
      end

      def leaf?
        true
      end
    end
  end
end
