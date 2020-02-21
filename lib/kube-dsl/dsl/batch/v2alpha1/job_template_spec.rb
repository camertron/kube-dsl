module KubeDSL::DSL::Batch::V2alpha1
  class JobTemplateSpec
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Batch::V1::JobSpec.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :job_template_spec
    end
  end
end
