json.extract! user_task, :id, :user_id, :task_id, :due_date, :start_time, :end_time, :remarks, :status_id, :deleted_at, :created_at, :updated_at
json.url user_task_url(user_task, format: :json)
