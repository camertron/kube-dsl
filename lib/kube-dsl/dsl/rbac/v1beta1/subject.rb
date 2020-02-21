module KubeDSL::DSL::Rbac::V1beta1
  class Subject
    extend ::KubeDSL::ValueFields

    value_fields :api_group, :kind, :name, :namespace

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiGroup] = api_group
        result[:kind] = kind
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :subject
    end
  end
end
