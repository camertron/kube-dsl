module KubeDSL::DSL::Coordination
  class LeaseList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Coordination::Lease.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "coordination.k8s.io/v1beta1"
        result[:kind] = "LeaseList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end