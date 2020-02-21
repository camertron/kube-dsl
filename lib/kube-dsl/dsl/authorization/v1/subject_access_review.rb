module KubeDSL::DSL::Authorization::V1
  class SubjectAccessReview
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Authorization::V1::SubjectAccessReviewSpec.new }
    object_field(:status) { KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "authorization.k8s.io/v1"
        result[:kind] = "SubjectAccessReview"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :subject_access_review
    end
  end
end
