# Controller that provides a layer to return simple
# select dropdown data options. The query setup is
# "built" in the front end and parse/used here
class SelectsController < ApplicationController
    before_action :validate_data, only: :index
  
    def index
      data = klass.joins(joins_statement)
                  .where(*where_statements)
                  .select(*select_statements)
                  .order(*order_statements)
  
      render json: { options: data.map(&:attributes) }
    end
  
    private
  
    def klass
      @klass = params[:model].constantize
    end
  
    def joins_statement
      return if params[:joins].blank?
  
      params[:joins].join(' ')
    end
  
    def where_statements
      params[:where] || [nil]
    end
  
    def select_statements
      params[:select] || [nil]
    end
  
    def order_statements
      params[:order] || [nil]
    end
  
    def validate_data
      # TODO: be smart about what data is required
      # params[:model] is required
      # params[:select], params[:where] should be arrays
    end
  end