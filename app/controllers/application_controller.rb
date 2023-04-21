class ApplicationController < ActionController::Base
    include ActionController::Cookies
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


private

def record_not_found
    render json: {error: "#{controller_name.classify} not found"}, status: 404
end

def record_invalid invalid
    render json: {errors: invalid.record.errors.full_messages}, status: 422
end
end
