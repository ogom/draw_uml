require 'rack'
require 'erb'

module DrawUml
  class Engine
    class << self
      def call(env)
        @request = Rack::Request.new(env)
        file_path = @request.params['path'] ||= nil
        image_path = nil

        unless file_path.nil?
          diagram = DrawUml::Diagram.new(DrawUml::Configure.dest_path)
          diagram.create(expand_path(file_path))
          file = File.basename(file_path, '.*')
          image_path = File.join(DrawUml::Configure.image_path, file + '.png')
        end

        erb = ERB.new(DrawUml::Configure.application_template)
        body = erb.result(binding)

        status = 200
        headers = {'Content-Type' => 'text/html'}
        [status, headers, [body]]
      end

      def tree
        @raw = ''
        branch(DrawUml::Tree.create(DrawUml::Configure.source_path))
        @raw
      end

      def branch(node)
        @raw += "<div style=\"padding-left: #{node.level}0px;\">\n"
        @raw += "<h3>#{node.name}</h3>\n"
        arr = []
        node.entries.each do |entry|
          if entry.leaf?
            arr << entry
          else
            branch(entry)
          end
        end
        @raw += "<ul>"
        @raw += arr.map do |entry|
          link_to(entry)
        end.join("\n")
        @raw += "</ul></div>\n"
      end

      private
        def link_to(entry)
          raw = ''
          raw += "<li>"
          raw += "<a href=#{@request.path}?path="
          raw += "#{contract_path(entry.path)}>#{entry.name}</a>"
          raw += "</li>"
          raw
        end

        def contract_path(path)
          path.sub(DrawUml::Configure.parent_path, '')
        end

        def expand_path(path)
          File.join(DrawUml::Configure.parent_path, path)
        end
      # end private
    end
  end
end
