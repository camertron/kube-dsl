module KubeDSL::DSL::Apps
  class DeploymentSpec
    extend ::KubeDSL::ValueFields
    value_fields :min_ready_seconds, :paused, :progress_deadline_seconds, :replicas, :revision_history_limit
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }
    object_field(:strategy) { KubeDSL::DSL::Apps::DeploymentStrategy.new }
    object_field(:template) { KubeDSL::DSL::PodTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:paused] = paused
        result[:progressDeadlineSeconds] = progress_deadline_seconds
        result[:replicas] = replicas
        result[:revisionHistoryLimit] = revision_history_limit
        result[:selector] = selector.serialize
        result[:strategy] = strategy.serialize
        result[:template] = template.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end