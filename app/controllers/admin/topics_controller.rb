class Admin::TopicsController < Admin::AdminController
  load_and_authorize_resource :topic, param_method: :topic_params

  def create
    @topic.save

    redirect_to admin_topics_path, flash: {success: "Topic created"}
  end

  def update
    @topic.update(topic_params)

    redirect_to admin_topics_path, flash: {success: "Topic updated"}
  end

  def destroy
    @topic.destroy

    redirect_to admin_topics_path, flash: {success: "Topic destroyed"}
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :tag)
  end
end
