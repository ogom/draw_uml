require 'rack'
require 'erb'

module DrawUml
  class Engine
    attr_accessor :request, :tree

    def call(env)
      @request = Rack::Request.new(env)
      @tree = DrawUml::Tree.create(DrawUml::Configure.source_path)

      status = 200
      headers = {'Content-Type' => 'text/html'}
      body = ERB.new(DrawUml::Configure.application_template).result(binding)

      [status, headers, [body]]
    end

    private
      def image_path
        path = nil
        entry = find_entry(request.path_info)
        unless entry.nil?
          diagram = DrawUml::Diagram.new(DrawUml::Configure.dest_path)
          diagram.create(entry.path, entry.id)
          path = File.join(DrawUml::Configure.image_path, entry.id + '.png')
        end
        path
      end

      def find_entry(id)
        raw = nil
        tree.each do |entry|
          if entry.id == id
            raw = entry
            break
          end
        end
        raw
      end

      def diagram_tag
        render_branch(tree)
      end

      def render_branch(node)
        raw = ''
        raw += "<div style=\"padding-left: #{node.level}0px;\">\n"
        raw += "<h3 onclick=\"check_branch('#{node.id}')\" >#{node.name}</h3>\n"
        raw += "<div id=#{node.id}>\n"
        arr = []
        node.entries.each do |entry|
          if entry.leaf?
            arr << entry
          else
            raw += render_branch(entry)
          end
        end
        raw += "<ul>" + arr.map do |entry|
          "<li><a href=#{request.script_name}#{entry.id}>#{entry.name}</a></li>"
        end.join("\n")
        raw += "</ul></div></div>\n"
        raw
      end
    # end private

    class << self
      def prototype
        @prototype ||= new
      end

      def call(env)
        prototype.call(env)
      end
    end
  end
end
