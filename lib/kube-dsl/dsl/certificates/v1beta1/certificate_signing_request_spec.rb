module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestSpec < ::KubeDSL::DSLObject
    value_fields :request, :uid, :username
    array_field :group
    array_field :usage
    object_field(:extra) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:request] = request
        result[:uid] = uid
        result[:username] = username
        result[:groups] = groups
        result[:usages] = usages
        result[:extra] = extra.serialize
      end
    end

    def kind
      :certificate_signing_request_spec
    end
  end
end