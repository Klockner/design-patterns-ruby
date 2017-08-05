require_relative 'report.rb'

class HTMLReport < Report
  def print_head
    puts '<head></head>'
  end

  def print_body
    puts '<body></body>'
  end

  def print_footer
    puts '</footer></footer>'
  end
end

HTMLReport.new.print
