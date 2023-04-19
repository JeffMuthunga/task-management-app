puts "Seeding data"

categories = ["Complete", "In review", "Pending"]
remarks = [
    "Great job on completing the task ahead of schedule!",
    "Please ensure to proofread your work next time.",
    "Let's discuss how we can improve your efficiency on this task.",
    "Please update the project manager on the progress of this task.",
    "This task has been re-assigned to another team member."
    ]

    Status.create!([
        {name: "Complete"},
        {name: "In review"},
        {name: "Pending"}
])
20.times do
Task.create!(
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    due_date: "2023-04-21",
    status_id: rand(1..3)
)
end
20.times do
    user = User.create!( 
        email_address: Faker::Internet.email,
        password_digest: Faker::Lorem.word
        )

    rand(1..5).times do
        UserTask.create(
            user_id: user.id,
            task_id: rand(1..20),
            due_date: "2023-04-21",
            start_time:"2023-04-21 08:00:00",
            end_time:"2023-04-21 10:00:00",
            remarks: remarks.sample,
            status_id: rand(1..3)
        )
    end
end

puts "Finished seeding data"