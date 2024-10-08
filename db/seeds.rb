Permission.create!([
                     {name: "View all jobs list", subject_class: "Job", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Post a job", subject_class: "Job", action: "create", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Update all jobs", subject_class: "Job", action: "update", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Remove jobs", subject_class: "Job", action: "destroy", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "View jobs by a specific employer", subject_class: "Job", action: "read", condition_attribute: "employer_id", condition_value: "employer_id", role: "employer", default: true},
                     {name: "Post a job", subject_class: "Job", action: "create", condition_attribute: "employer_id", condition_value: "employer_id", role: "employer", default: true},
                     {name: "Update jobs", subject_class: "Job", action: "update", condition_attribute: "employer_id", condition_value: "employer_id", role: "employer", default: true},
                     {name: "Make a copy", subject_class: "Job", action: "make_a_copy", condition_attribute: "", condition_value: "", role: "all", default: true},
                     {name: "Remove bounce", subject_class: "Job", action: "remove_bounce", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Resend apps", subject_class: "Job", action: "resend_apps", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Full filter", subject_class: "Job", action: "full_filter", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Filter by title", subject_class: "Job", action: "filter_by_title", condition_attribute: "", condition_value: "", role: "employer", default: true},
                     {name: "Filter by date range", subject_class: "Job", action: "filter_by_date_range", condition_attribute: "", condition_value: "", role: "employer", default: true},
                     {name: "Change job title, job URL, skill tags", subject_class: "Job", action: "update_special_attribute", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "View Poster", subject_class: "Job", action: "view_poster", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "View 200 CVs", subject_class: "JobApplication", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "Approve CV", subject_class: "JobApplication", action: "update", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "Filter by employer", subject_class: "JobApplication", action: "read_full_info", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "View error", subject_class: "JobApplication", action: "view_error", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "View CV", subject_class: "JobApplication", action: "read", condition_attribute: "job_id", condition_value: "job_ids", role: "employer", default: true},
                     {name: "Filter by job title / name / email", subject_class: "JobApplication", action: "filter_by_employer", condition_attribute: "", condition_value: "", role: "employer", default: true},
                     {name: "View activity", subject_class: "AdminUser", action: "read_activities", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View all employers list", subject_class: "Employer", action: "read_all", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "View employer", subject_class: "Employer", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Create employer", subject_class: "Employer", action: "create", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Update employer", subject_class: "Employer", action: "update", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Remove employer", subject_class: "Employer", action: "destroy", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Add Trial Credits", subject_class: "Employer", action: "give_credits", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "View employer", subject_class: "Employer", action: "read", condition_attribute: "id", condition_value: "employer_id", role: "employer", default: true},
                     {name: "Update employer", subject_class: "Employer", action: "update", condition_attribute: "id", condition_value: "employer_id", role: "employer", default: true},
                     {name: "View Purchase Order list", subject_class: "PaymentRequest", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Create Purchase Order", subject_class: "PaymentRequest", action: "create", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Update Purchase Order", subject_class: "PaymentRequest", action: "update", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Remove Purchase Order", subject_class: "PaymentRequest", action: "destroy", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Send/resend payment request", subject_class: "PaymentRequest", action: "send_payment_request", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Send/resend service order", subject_class: "PaymentRequest", action: "send_service_order", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Grant Credits", subject_class: "PaymentRequest", action: "grant_credits", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View all reviews", subject_class: "Review", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "Approve reviews", subject_class: "Review", action: "update", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View employer response", subject_class: "Review", action: "read_employer_response", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "Show/Hide employer response", subject_class: "Review", action: "update_employer_response", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View reviews by a specific employer", subject_class: "Review", action: "read", condition_attribute: "employer_id", condition_value: "employer_id", role: "employer", default: true},
                     {name: "View HN/CS", subject_class: "BrandingCompany", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: true},
                     {name: "Schedule HN/CS", subject_class: "BrandingCompany", action: "create", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "Update HN/CS", subject_class: "BrandingCompany", action: "update", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View JR", subject_class: "JobMail", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View IJR", subject_class: "InferredJobMail", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View VJR", subject_class: "ViewedJobMail", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "Update Setting", subject_class: "Setting", action: "update", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "View account list", subject_class: "AdminUser", action: "read_all", condition_attribute: nil, condition_value: nil, role: "admin", default: true},
                     {name: "View account info", subject_class: "AdminUser", action: "read", condition_attribute: nil, condition_value: nil, role: "admin", default: true},
                     {name: "Update itself", subject_class: "AdminUser", action: "update", condition_attribute: "id", condition_value: "id", role: "admin", default: true},
                     {name: "Add new account", subject_class: "AdminUser", action: "create", condition_attribute: "role_mask", condition_value: "role_mask_employer", role: "admin", default: true},
                     {name: "Update account", subject_class: "AdminUser", action: "update", condition_attribute: "role_mask", condition_value: "role_mask_employer", role: "admin", default: true},
                     {name: "View info itself", subject_class: "AdminUser", action: "read", condition_attribute: "id", condition_value: "id", role: "employer", default: true},
                     {name: "Update info itself", subject_class: "AdminUser", action: "update", condition_attribute: "id", condition_value: "id", role: "employer", default: true},
                     {name: "Remove invalid email same company", subject_class: "AdminUser", action: "destroy", condition_attribute: "id", condition_value: "admin_users_same_employer", role: "employer", default: true},
                     {name: "View total price PO", subject_class: "PaymentRequest", action: "view_total_price", condition_attribute: nil, condition_value: nil, role: "admin", default: false},
                     {name: "View User Profile", subject_class: "UserProfile", action: "read", condition_attribute: "", condition_value: "", role: "admin", default: false},
                     {name: "Admin View CV", subject_class: "JobApplication", action: "read", condition_attribute: nil, condition_value: nil, role: "admin", default: false},
                     {name: "View Red Invoices", subject_class: "PaymentRequest", action: "view_red_invoices", condition_attribute: nil, condition_value: nil, role: "admin", default: false},
                     {name: "View User List", subject_class: "User", action: "read_all", condition_attribute: nil, condition_value: nil, role: "admin", default: false}
                   ])