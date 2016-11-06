class CommentsController < ApplicationController
    
    before_action :authenticate_user!
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(params[:comment].permit(:body))
        @comment.user_id = current_user.id if current_user
        
        if @comment.save
            redirect_to article_path(@article), notice: "Your comment has been saved."
        else
            redirect_to 'new'
        end
    end
    
    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        
        if @comment.update(params[:comment].permit[:body])
            redirect_to article_path(@article), notice: "Your comment has been updated"
        end
        
    end
    
    def edit
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comments.destroy
        redirect_to article_path(@article), notice: "Your comment has been deleted"
    end
    
    
end