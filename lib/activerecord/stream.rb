require "activerecord/stream/version"
require 'core_ext/enumerator/take'
require 'core_ext/enumerator/drop'
require 'core_ext/enumerator/filter'

module ActiveRecord
  module Stream
    extend ActiveSupport::Concern

    module ClassMethods

      def stream(options={})
        offset = options[:start] || 0
        batch_size = options[:batch_size] || 500
        scope = respond_to?(:scoped) ? scoped : all

        Enumerator.new do |yielder|
          loop do
            current_batch = load_batch(scope, batch_size, offset)
            current_batch.each{|r| yielder << r}

            break if current_batch.length < batch_size
            offset += batch_size
          end
        end
      end

      private
      def load_batch(scope, limit, offset)
        scope.limit(limit).offset(offset).to_a
      end

    end

  end
end

ActiveRecord::Base.send(:include, ActiveRecord::Stream)
ActiveRecord::Relation.send(:include, ActiveRecord::Stream)