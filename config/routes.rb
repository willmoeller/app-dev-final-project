Rails.application.routes.draw do
  # Application routes:
  get("/", { :controller => "application", :action => "index" })
  get("/sign_up", { :controller => "application", :action => "sign_up" })
  get("/sign_in", { :controller => "application", :action => "sign_in" })

  # Routes for a User authentication:
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  post("/create_user_account", { :controller => "user_authentication", :action => "create_account" })
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  # Routes for User information:
  get("/user_dashboard", { :controller => "users", :action => "dashboard" })
  get("/show_user_profile", { :controller => "users", :action => "show_profile" })
  get("/edit_user_profile", { :controller => "users", :action => "edit_profile_form" })
  post("/update_user_profile", { :controller => "users", :action => "update_profile" })
  get("/edit_user_password", { :controller => "users", :action => "edit_password_form" })
  post("/update_user_password", { :controller => "users", :action => "update_password" })
  get("/user_preferences", { :controller => "users", :action => "preferences" })
  get("/delete_user_account", { :controller => "users", :action => "destroy_account" })
  post("/update_user_preferences", { :controller => "users", :action => "update_preferences" })
  get("/delete_user_preference/:preference", { :controller => "users", :action => "destroy_preference" })

  # Routes for Company authentication:
  get("/company_sign_up", { :controller => "company_authentication", :action => "sign_up_form" })
  post("/create_company_account", { :controller => "company_authentication", :action => "create_account" })
  get("/company_sign_in", { :controller => "company_authentication", :action => "sign_in_form" })
  post("/company_verify_credentials", { :controller => "company_authentication", :action => "create_cookie" })
  get("/company_sign_out", { :controller => "company_authentication", :action => "destroy_cookies" })

  # Routes for Company information:
  get("/company_dashboard", { :controller => "company", :action => "dashboard" })
  get("/show_company_profile", { :controller => "company", :action => "show_profile" })
  get("/edit_company_profile", { :controller => "company", :action => "edit_profile_form" })
  post("/update_company_profile", { :controller => "company", :action => "update_profile" })
  get("/edit_company_password", { :controller => "company", :action => "edit_password_form" })
  post("/update_company_password", { :controller => "company", :action => "update_password" })
  get("/delete_company_account", { :controller => "company", :action => "destroy_account" })

  # Routes for Trusted relationships:
  get("/show_company/:path_id", { :controller => "trusted_relationships", :action => "show_company_to_users" })
  get("/user_companies", { :controller => "trusted_relationships", :action => "show_user_companies" })

  # CREATE
  post("/insert_trusted_relationship", { :controller => "trusted_relationships", :action => "create" })

  # READ
  get("/trusted_relationships", { :controller => "trusted_relationships", :action => "index" })

  get("/trusted_relationships/:path_id", { :controller => "trusted_relationships", :action => "show" })

  # UPDATE

  post("/modify_trusted_relationship/:path_id", { :controller => "trusted_relationships", :action => "update" })

  # DELETE
  get("/delete_trusted_relationship/:path_id", { :controller => "trusted_relationships", :action => "destroy" })

  #------------------------------
end
