module Types
  class AdminUserFilterParams < Types::BaseInputObject
    argument :page_index, Int, required: false, default_value: 1
    argument :page_size, Int, required: false, default_value: 20
    argument :employer_id, String, required: false, default_value: nil
    argument :email, String, required: false, default_value: nil
    argument :created_by, Int, required: false, default_value: nil
  end
end
