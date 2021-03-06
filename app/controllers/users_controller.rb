class UsersController < ApplicationController
    
    def search_products_under_bid

        product_name = params[:name]
        category_id = params[:category_id].to_i
        highest_bid = params[:highest_bid].to_f
        
        product = ProductsUnderBid.search_products_under_bid(name: product_name, category_id: category_id, highest_bid: highest_bid)

        respond_to do |format|
            format.html { redirect_to product, notice: 'Products under bid was successfully created.' }
            format.json { render json: product }
        end
    end
    
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    
    def search_params
      params.require(:search).permit(:name, :category_id, :highest_bid)
    end
    
end
