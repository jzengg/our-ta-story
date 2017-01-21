# Scaffolding generated by Casein v5.2.0.0

module Casein
  class StoriesController < Casein::CaseinController
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_action :needs_admin, except: [:action1, :action2]
    # before_action :needs_admin_or_current_user, only: [:action1, :action2]

    def index
      @casein_page_title = 'Stories'
      @stories = Story.order(sort_order(:name)).paginate page: params[:page]
    end

    def show
      @casein_page_title = 'View story'
      @story = Story.find params[:id]
    end

    def new
      @casein_page_title = 'Add a new story'
      @story = Story.new
    end

    def create
      @story = Story.new story_params

      if @story.save
        flash[:notice] = 'Story created'
        redirect_to casein_stories_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new story'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update story'

      @story = Story.find params[:id]

      if @story.update_attributes story_params
        flash[:notice] = 'Story has been updated'
        redirect_to casein_stories_path
      else
        flash.now[:warning] = 'There were problems when trying to update this story'
        render action: :show
      end
    end

    def destroy
      @story = Story.find params[:id]

      @story.destroy
      flash[:notice] = 'Story has been deleted'
      redirect_to casein_stories_path
    end

    private

    def story_params
      params.require(:story).permit(:name, :body, :is_published)
    end
  end
end
