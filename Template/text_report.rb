require_relative 'report.rb'

class TextReport < Report
  def print_head
    puts 'Head'
  end

  def print_body
    puts 'Content'
  end

  def print_footer
    puts 'Footer'
  end
end

TextReport.new.print
