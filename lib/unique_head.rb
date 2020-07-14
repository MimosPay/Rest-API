# Unique header generation
require 'middleman-core/renderers/redcarpet'
require 'digest'
require 'logger'
#require 'middleman-core/logger'

class UniqueHeadCounter < Middleman::Renderers::MiddlemanRedcarpetHTML
  def initialize
    super
    @head_count = {}
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::INFO
  end
  def header(text, header_level)
    headers = text.scan(/{#([^>]*)}/)
    header_id = headers.empty? ? nil : headers.last.first
    new_text = text.gsub(/{#([^>]*)}/,"").strip()
    text_parameterize = new_text.gsub(/<[^>]*>/,"").sub(/\s/, "").parameterize
    friendly_text = header_id.nil? ? text_parameterize : header_id
    @logger.info("default header id: #{text_parameterize}")
    @logger.info("header id: #{header_id}")
    @logger.info("finally header id: #{friendly_text}")
    @logger.info("----------------------")
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
    return "<h#{header_level} id='#{friendly_text}'>#{new_text}</h#{header_level}>"
  end
end
