module DrawUml
  module Configure
    class << self
      attr_accessor :diagram_extension, :diagram_path, :static_path, :image_path

      def setup
        keys.each do |key|
          instance_variable_set(:"@#{key}", DrawUml::Default.send(key))
        end
      end

      def keys
        @keys ||= %i[diagram_extension diagram_path static_path image_path]
      end

      def source_path
        File.expand_path(self.diagram_path)
      end

      def parent_path
        File.expand_path('..', self.source_path)
      end

      def dest_path
        File.expand_path(File.join(self.static_path, self.image_path))
      end

      def templates_path
        DrawUml.root.join('lib', 'templates').to_s
      end

      def application_template
        File.read(File.expand_path('application.html.erb', File.join(self.templates_path, 'layouts')))
      end
    end
  end
end
