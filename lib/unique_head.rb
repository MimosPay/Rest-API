# Unique header generation
require 'middleman-core/renderers/redcarpet'
require 'digest'
require 'logger'

logger = Logger.new(STDOUT)

class UniqueHeadCounter < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
    @head_count = {}
  end
  def header(text, header_level)
    header_id = text.scan(/{([^>]*)}/).last.first
    text_parameterize = text.gsub(/{([^>]*)}/,"").gsub(/<[^>]*>/,"").sub(/\s/, "").parameterize
    friendly_text = header_id.nil? ? text_parameterize : header_id
    logger.info "header id: #{header_id}"
    logger.info "text #{text_parameterize}"
    logger.info "finally #{friendly_text}"
    if friendly_text.strip.length == 0
      # Looks like parameterize removed the whole thing! It removes many unicode
      # characters like Chinese and Russian. To get a unique URL, let's just
      # URI escape the whole header
      friendly_text = Digest::SHA1.hexdigest(text)[0,10]
    end
    @head_count[friendly_text] ||= 0
    @head_count[friendly_text] += 1
    if @head_count[friendly_text] > 1
      friendly_text += "-#{@head_count[friendly_text]}"
    end
    return "<h#{header_level} id='#{friendly_text}'>#{text}</h#{header_level}>"
  end
end
