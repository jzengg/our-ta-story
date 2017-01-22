class StaticPagesController < ApplicationController
  def home
    @stories = Story.published_not_featured(count: 4)
    @featured = Story.featured
  end

  def about
  end

  def interview_guide
    render 'static_pages/interview_guide'
  end

  def contact
  end
end
