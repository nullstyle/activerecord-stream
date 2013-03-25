module Enumerator::Filter
  def filter(&block)
    
    Enumerator.new do |yielder|

      begin
        loop do
          val = self.next
          should_yield = block.call(val)
          yielder << val if should_yield
        end
      rescue StopIteration
      end
    end
  end
end

Enumerator.send(:include, Enumerator::Filter)