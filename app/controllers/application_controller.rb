class ApplicationController < ActionController::Base
rescue_from ActiveRecord::RecordNotFound, with: :not_found 
rescue_from Exception, with: :not_found
rescue_from ActionController::RoutingError, with: :not_found

def raise_not_found
  raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
end

def not_found
  respond_to do |format|
    format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found }
    format.xml { head :not_found }
    format.any { head :not_found }
  end
end

def error
  respond_to do |format|
    format.html { render file: "#{Rails.root}/public/500.html", layout: false, status: :error }
    format.xml { head :not_found }
    format.any { head :not_found }
  end
end
end
