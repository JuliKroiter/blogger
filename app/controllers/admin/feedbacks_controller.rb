class Admin::FeedbacksController < Admin::AdminController
  load_and_authorize_resource :feedback, param_method: :feedback_params

  def create
    @feedback.save

    redirect_to admin_feedbacks_path, flash: {success: "Feedback created"}
  end

  def update
    @feedback.update(feedback_params)

    redirect_to admin_feedbacks_path, flash: {success: "Feedback updated"}
  end

  def destroy
    @feedback.destroy

    redirect_to admin_feedbacks_path, flash: {success: "Feedback destroyed"}
  end

  private

  def feedback_params
    params.require(:feedback).permit(:commenter_name, :commenter_picture, :short_desc, :long_desc)
  end
end
