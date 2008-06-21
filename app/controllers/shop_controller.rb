class ShopController < ApplicationController

# --=> TO DO: reorder the session data to match the current order passed from params

  # List all items (initial view)
  def index
    session[:col_1] ||= {}
    session[:col_2] ||= {}
    @scripts = Script.find(:all)
  end

  # Add a item to Col 1
  def add_col_1
    script_id = params[:id].split("_")[1]
    session[:col_1][script_id] = 1
    render :partial => 'cart'
  end

  # Add a item to Col 2
  def add_col_2
    script_id = params[:id].split("_")[1]
    session[:col_2][script_id] = 1
    render :partial => 'cart'
  end

  # Remove a item Col 1
  def remove_col1
    script_id = params[:id].split("_")[1]
    session[:col_1].delete(script_id)
    render :partial => 'cart'
  end

  # Remove a item Col 2
  def remove_col2
    script_id = params[:id].split("_")[1]
    session[:col_2].delete(script_id)
    render :partial => 'cart'
  end

  # Change order of Col 1
  def order_col1
      @col_1 = params[:col_1]
      @tmp = {}
      i=0
      session[:col_1] = {}
      params[:col_1].each{|x| session[:col_1]["#{x}"] = 1}
      # session[:col_1] = params[:col_1].each_key{|x| ["#{x}"] = 1}
      # params[:col_1].each{|x| @tmp["#{x}"] = 1}
      # session[:col_1] = @tmp
      # session[:col_1] = params[:col_1]
      @col_1_session = session[:col_1]
      @col_2_session = session[:col_2]
      # @params = params
      render :partial => 'order'
  end

  # Change order of Col 2
  def order_col2
      @col_2 = params[:col_2]
      @col_1_session = session[:col_1]
      @col_2_session = session[:col_2]
      render :partial => 'order'
  end

  # Remove all items
  def clear
    session[:col_1] = {}
    session[:col_2] = {}
    redirect_to :action=>"index"
  end

end
