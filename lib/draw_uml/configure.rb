module DrawUml
  module Configure
    class << self
      attr_accessor :diagram_extension, :diagram_path, :static_path, :image_path

      def setup
        keys.each do |key|
          instance_variable_set(:"@#{key}", DrawUml::Default.send(key))
        end

        FileUtils.mkdir_p(self.source_path)
      end

      def keys
        @keys ||= %i[diagram_extension diagram_path static_path image_path]
      end

      def source_path
        @source_path ||= File.expand_path(self.diagram_path)
      end

      def dest_path
        @dest_path ||= File.expand_path(File.join(self.static_path, self.image_path))
      end

      def templates_path
        @templates_path ||= DrawUml.root.join('lib', 'templates').to_s
      end

      def application_layout
        @application_layout ||= File.expand_path('application.html.erb', File.join(self.templates_path, 'layouts'))
      end

      def application_template
        File.read(self.application_layout)
      end
    end
  end
end
