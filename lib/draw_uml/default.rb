module DrawUml
  module Default
    DIAGRAM_EXTENSION = 'uml'.freeze
    DIAGRAM_PATH = 'doc/diagrams/uml'.freeze
    STATIC_PATH = 'public'.freeze
    IMAGE_PATH = 'images/uml'.freeze

    class << self
      def options
        Hash[DrawUml::Configure.keys.map{|key| [key, send(key)]}]
      end

      def diagram_extension
        DIAGRAM_EXTENSION
      end

      def diagram_path
        DIAGRAM_PATH
      end

      def static_path
        STATIC_PATH
      end

      def image_path
        IMAGE_PATH
      end
    end
  end
end
