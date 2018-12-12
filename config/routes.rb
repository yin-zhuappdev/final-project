Rails.application.routes.draw do
  devise_for :users
  # Routes for the Interested plan resource:
  root "insurance_plans#index"

  # CREATE
  get("/comments/new", {:controller => "comments", :action => "new_form"})
  post("/create_comment", {:controller => "comments", :action => "create_row"})

  # READ
  get("/comments", {:controller => "comments", :action => "index"})
  get("/comments/:id_to_display", {:controller => "comments", :action => "show"})

  # UPDATE
  get("/comments/:prefill_with_id/edit", {:controller => "comments", :action => "edit_form"})
  post("/update_comment/:id_to_modify", {:controller => "comments", :action => "update_row"})

  # DELETE
  get("/delete_comment/:id_to_remove", {:controller => "comments", :action => "destroy_row"})

  #------------------------------

  # CREATE
  get("/interested_plans/new", {:controller => "interested_plans", :action => "new_form"})
  post("/create_interested_plan", {:controller => "interested_plans", :action => "create_row"})

  # READ
  get("/interested_plans", {:controller => "interested_plans", :action => "index"})
  get("/interested_plans/:id_to_display", {:controller => "interested_plans", :action => "show"})

  # UPDATE
  get("/interested_plans/:prefill_with_id/edit", {:controller => "interested_plans", :action => "edit_form"})
  post("/update_interested_plan/:id_to_modify", {:controller => "interested_plans", :action => "update_row"})

  # DELETE
  get("/delete_interested_plan/:id_to_remove", {:controller => "interested_plans", :action => "destroy_row"})

  #------------------------------

  # Routes for the Insurance plan resource:

  # CREATE
  get("/insurance_plans/new", {:controller => "insurance_plans", :action => "new_form"})
  post("/create_insurance_plan", {:controller => "insurance_plans", :action => "create_row"})

  # READ
  get("/insurance_plans", {:controller => "insurance_plans", :action => "index"})
  get("/insurance_plans/:id_to_display", {:controller => "insurance_plans", :action => "show"})

  # UPDATE
  get("/insurance_plans/:prefill_with_id/edit", {:controller => "insurance_plans", :action => "edit_form"})
  post("/update_insurance_plan/:id_to_modify", {:controller => "insurance_plans", :action => "update_row"})

  # DELETE
  get("/delete_insurance_plan/:id_to_remove", {:controller => "insurance_plans", :action => "destroy_row"})

  #------------------------------

  # READ
  get("/compare_interested_plans", {:controller => "compare_interested_plans", :action => "index"})
  
  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
