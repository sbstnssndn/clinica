# the ability to have a dynamic form attached to a record
# module Formable
#   extend ActiveSupport::Concern
#
#   included do
#     has_many :form_fields, as: :formable
#     accepts_nested_attributes_for :form_fields, allow_destroy: true
#   end
# end