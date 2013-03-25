module Enumerator::Take
  def take(count)
    result = []
    count.times do
      result << self.next
    end
    result
  rescue StopIteration
    result
  end
end

Enumerator.send(:include, Enumerator::Take)