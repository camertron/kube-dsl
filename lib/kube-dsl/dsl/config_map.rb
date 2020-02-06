module KubeDSL::DSL
  class ConfigMap
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:binary_data) { ::KubeDSL::KeyValueFields.new }
    object_field(:data) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ConfigMap"
        result[:metadata] = metadata.serialize
        result[:binaryData] = binary_data.serialize
        result[:data] = data.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end