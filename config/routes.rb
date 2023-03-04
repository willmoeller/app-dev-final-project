Rails.application.routes.draw do
  # Routes for the Company account:

  # SIGN UP FORM
  get("/company_sign_up", { :controller => "company_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_company", { :controller => "company_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_company_profile", { :controller => "company_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_company", { :controller => "company_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_company_account", { :controller => "company_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/company_sign_in", { :controller => "company_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/company_verify_credentials", { :controller => "company_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/company_sign_out", { :controller => "company_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  get("/", { :controller => "application", :action => "index" })
  get("/dashboard", { :controller => "application", :action => "dashboard" })

  # Routes to create an update User accounts:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })
  # SHOW USER PROFILE
  get("/show_user_profile", { :controller => "user_authentication", :action => "show" })
  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # Routes for Brand authentication:
  get("/company_sign_up", { :controller => "company_authentication", :action => "company_sign_up_form" })
  post("/insert_company", { :controller => "company_authentication", :action => "create_company" })

  # Routes to CRUD data in Brand accounts:

  # Routes to CRUD data in User accounts:

  # Routes to sign in and sign out:

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

  # Routes to sign in and sign out:

end
