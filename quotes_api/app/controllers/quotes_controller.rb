class QuotesController < ApplicationController
    before_action :set_quotes, only: [:show , :update , :destroy]

    def index 
        @quote = Quote.where(quote_query_params)
        render json: @quote
    end

    def show 
        render json: @quote
    end


    def create 
        @quote = Quote.create(quote_params)
        byebug
        render json: @quote
    end

    def update
        @quote.update_attributes(quote_params)
        render json: @quote
    end

    def destroy 
        @quote.destroy
        render json:{message : "Success"}
    end

    def set_quote
        @quote = quote.find(params[:id])
    end

    private
    def quote_params
        params.require(:quote).permit(
          :content, :author, :category
        )
    end

    def quote_query_params 
        params.require(:quote).permit(
          :content, :author, :category
        )
    end

    
end
