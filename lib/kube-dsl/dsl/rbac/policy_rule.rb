module KubeDSL::DSL::Rbac
  class PolicyRule
    extend ::KubeDSL::ValueFields
    array_field :api_group
    array_field :non_resource_url
    array_field :resource_name
    array_field :resource
    array_field :verb

    def serialize
      {}.tap do |result|
        result[:apiGroups] = api_groups
        result[:nonResourceURLs] = non_resource_urls
        result[:resourceNames] = resource_names
        result[:resources] = resources
        result[:verbs] = verbs
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end