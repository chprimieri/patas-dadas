# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Learn more: http://github.com/javan/whenever

every 15.minutes do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  runner "Passeio.mudanca_de_status"
end
