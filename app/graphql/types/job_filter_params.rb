class Types::JobFilterParams < Types::BaseInputObject
  argument :scope, String, required: false
  argument :sort_field, String, required: false, default_value: 'created_at'
  argument :sort_direction, String, required: false, default_value: 'desc'
  argument :employerId, String, required: false
  argument :title, String, required: false
  argument :skillTagIds, [String], required: false
  argument :dateRange, String, required: false
  argument :city, String, required: false
end
