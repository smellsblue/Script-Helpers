module ScriptHelpers
  module ScriptAndCssHelper
    def script(options = {}, &block)
      if options.include? :src
        @_script_helpers_script ||= {}

        unless @_script_helpers_script[options[:src]]
          @_script_helpers_script[options[:src]] = true
          content_for :script_tags, "\n"
          content_for :script_tags, javascript_include_tag(options[:src])
        end
      end

      if block
        return javascript_tag &block if options[:inline]
        content_for :script, "\n"
        content_for :script, capture(&block)
      end

      nil
    end

    def script_tag_contents
      content_for :script_tags
    end

    def script_contents
      contents = content_for :script

      if contents.present?
        javascript_tag contents
      end
    end

    def css(options = {}, &block)
      if options.include? :src
        @_script_helpers_css ||= {}

        unless @_script_helpers_css[options[:src]]
          @_script_helpers_css[options[:src]] = true
          content_for :css_tags, "\n"
          content_for :css_tags, stylesheet_link_tag(options[:src])
        end
      end

      if block
        content_for :css, "\n"
        content_for :css, capture(&block)
      end
    end

    def css_tag_contents
      content_for :css_tags
    end

    def css_contents
      contents = content_for :css

      if contents.present?
        content_tag :style, contents, :type => "text/css"
      end
    end
  end
end
