class RecipesController < ApplicationController
    
    def error
        head 404
    end

    def show_one
        begin
            recipe = Recipe.find(params[:id])            
            render :json => {
                "message": "Recipe details by id",
                "recipe": recipe
            }
        rescue => exception
            render :json => { "message":"No Recipe found" }
        end
    end

    def show_all 
        begin
            recipe = Recipe.all
            render :json => {"recipe": recipe}
        rescue => exception
            render :json => { "message":"No Recipe found" }
        end
    end

    def create
        begin
            recipe = Recipe.create(
                title: params[:title],
                making_time: params[:making_time],
                serves: params[:serves],
                ingredients: params[:ingredients],
                cost: params[:cost],      
            )
            render :json => {
                "message": "Recipe successfully created!",
                "recipe": recipe
            }
        rescue => exception
            render :json => {
                "message": "Recipe creation failed!",
                "required": "title, making_time, serves, ingredients, cost"
            }
        end
    end

    def update
        begin
            recipe = Recipe.find(params[:id]).update(
                title: params[:title],
                making_time: params[:making_time],
                serves: params[:serves],
                ingredients: params[:ingredients],
                cost: params[:cost],      
            )
            render :json => {
                "message": "Recipe successfully updated!",
                "recipe": recipe
            }
        rescue => exception
            render :json => {
                "message": "Recipe updation failed!",
                "required": "title, making_time, serves, ingredients, cost"
            }
        end        
    end

    def delete 
        begin
            Recipe.find(params[:id]).delete 
            render :json => {  "message": "Recipe successfully removed!" }
        rescue => exception
            render :json => { "message":"No Recipe found" }
        end
    end

end