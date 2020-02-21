module KubeDSL::DSL::Apps::V1beta2
  class DeploymentStatus
    extend ::KubeDSL::ValueFields

    value_fields :available_replicas, :collision_count, :observed_generation, :ready_replicas, :replicas, :unavailable_replicas, :updated_replicas
    array_field(:condition) { KubeDSL::DSL::Apps::V1beta2::DeploymentCondition.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:availableReplicas] = available_replicas
        result[:collisionCount] = collision_count
        result[:observedGeneration] = observed_generation
        result[:readyReplicas] = ready_replicas
        result[:replicas] = replicas
        result[:unavailableReplicas] = unavailable_replicas
        result[:updatedReplicas] = updated_replicas
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :deployment_status
    end
  end
end
