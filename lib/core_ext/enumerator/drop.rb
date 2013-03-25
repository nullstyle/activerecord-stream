module Enumerator::Drop
  def drop(count)
    count.times{ self.next }
  rescue StopIteration
    ; # noop
  end
end

Enumerator.send(:include, Enumerator::Drop)