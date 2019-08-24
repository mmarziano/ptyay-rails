class CommentsController < ApplicationController
    layout "main"

    def new
        @comment = Comment.new
    end 

    def create
        @comment = Comment.new(text: params[:comment], fundraiser_id: params[:fundraiser_id])
        @comment.user_id = current_user.id
        @fundraiser = Fundraiser.find(params[:fundraiser_id])
        if @comment.save
            redirect_to fundraiser_path(@fundraiser)
        end
    end 

    def edit
        @comment = Comment.find(params[:id])
    end 

    def update
        @comment = Comment.find(params[:id])
    end 

    def destroy
        @comment = Comment.find(params[:id])
    end 

  
end
