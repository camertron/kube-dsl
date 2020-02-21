module KubeDSL::DSL::Apps::V1beta2
  class StatefulSetUpdateStrategy
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Apps::V1beta2::RollingUpdateStatefulSetStrategy.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:rollingUpdate] = rolling_update.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :stateful_set_update_strategy
    end
  end
end
