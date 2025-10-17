class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = @list.reviews.new(review_params)

    if @review.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
