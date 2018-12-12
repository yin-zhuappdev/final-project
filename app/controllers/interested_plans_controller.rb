class InterestedPlansController < ApplicationController
  def index
    @interested_plans = InterestedPlan.all

    render("interested_plan_templates/index.html.erb")
  end

  def show
    @interested_plan = InterestedPlan.find(params.fetch("id_to_display"))

    render("interested_plan_templates/show.html.erb")
  end

  def new_form
    @interested_plan = InterestedPlan.new

    render("interested_plan_templates/new_form.html.erb")
  end

  def create_row
    @interested_plan = InterestedPlan.new

    @interested_plan.insurance_plan_id = params.fetch("insurance_plan_id")
    @interested_plan.user_id = params.fetch("user_id")

    if @interested_plan.valid?
      @interested_plan.save

      redirect_to("/interested_plans", :notice => "Interested plan created successfully.")
    else
      render("interested_plan_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @interested_plan = InterestedPlan.find(params.fetch("prefill_with_id"))

    render("interested_plan_templates/edit_form.html.erb")
  end

  def update_row
    @interested_plan = InterestedPlan.find(params.fetch("id_to_modify"))

    @interested_plan.insurance_plan_id = params.fetch("insurance_plan_id")
    @interested_plan.user_id = params.fetch("user_id")

    if @interested_plan.valid?
      @interested_plan.save

      redirect_to("/interested_plans/#{@interested_plan.id}", :notice => "Interested plan updated successfully.")
    else
      render("interested_plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @interested_plan = InterestedPlan.find(params.fetch("id_to_remove"))

    @interested_plan.destroy
    redirect_back(:fallback_location => "/interested_plans", :notice => "Interested plan deleted successfully.")

  end
end
