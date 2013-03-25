module Enumerator::Filter
  def select(&block)
    filter(true, &block)
  end

  def reject(&block)
    filter(false, &block)
  end

  private
  def filter(filter_val, &block)
    Enumerator.new do |yielder|

      begin
        loop do
          val = self.next
          should_yield = block.call(val) == filter_val
          yielder << val if should_yield
        end
      rescue StopIteration
      end
    end
  end

end

Enumerator.send(:include, Enumerator::Filter)