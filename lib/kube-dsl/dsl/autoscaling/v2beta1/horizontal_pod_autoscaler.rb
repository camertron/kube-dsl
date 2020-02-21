module KubeDSL::DSL::Autoscaling::V2beta1
  class HorizontalPodAutoscaler
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerSpec.new }
    object_field(:status) { KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v2beta1"
        result[:kind] = "HorizontalPodAutoscaler"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :horizontal_pod_autoscaler
    end
  end
end
