class OurWorksController < ApplicationController
    before_action :set_post, only: %i[ gallery ]
    def index
    @works = Work.all
    @title = "Our Works"
    end

    def gallery

    end

    def set_post
        @post = Post.where(work_id: params[:work_id])
        @work_title = Work.find(params[:work_id])
        @title = "Gallery"
    end
    
end
