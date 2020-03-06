module KubeDSL::DSL::V1
  class ComponentStatusList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::ComponentStatus.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ComponentStatusList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :component_status_list
    end
  end
end