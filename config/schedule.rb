every :sunday, :at => '1pm' do # Use any day of the week or :weekend, :weekday
  runner "Task.send_newsletter  "
end

every :tuesday, :at => '1pm' do # Use any day of the week or :weekend, :weekday
  runner "Task.send_newsletter  "
end

every :thursday, :at => '1pm' do # Use any day of the week or :weekend, :weekday
  runner "Task.send_newsletter  "
end