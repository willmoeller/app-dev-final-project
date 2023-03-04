Rails.application.routes.draw do
  # Application routes:
  get("/", { :controller => "application", :action => "index" })
  get("/sign_up", { :controller => "application", :action => "sign_up" })
  get("/sign_in", { :controller => "application", :action => "sign_in" })
  get("/user_dashboard", { :controller => "user_authentication", :action => "dashboard" })
  get("/company_dashboard", { :controller => "company_authentication", :action => "dashboard" })

  # Routes for the Company account:
  get("/company_sign_up", { :controller => "company_authentication", :action => "sign_up_form" })
  post("/insert_company", { :controller => "company_authentication", :action => "create" })
  get("/edit_company_profile", { :controller => "company_authentication", :action => "edit_profile_form" })
  post("/modify_company", { :controller => "company_authentication", :action => "update" })
  get("/cancel_company_account", { :controller => "company_authentication", :action => "destroy" })
  get("/company_sign_in", { :controller => "company_authentication", :action => "sign_in_form" })
  post("/company_verify_credentials", { :controller => "company_authentication", :action => "create_cookie" })
  get("/company_sign_out", { :controller => "company_authentication", :action => "destroy_cookies" })

  # Routes for the User account:
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  post("/insert_user", { :controller => "user_authentication", :action => "create" })
  get("/show_user_profile", { :controller => "user_authentication", :action => "show" })
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
end
