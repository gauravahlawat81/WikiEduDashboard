# Quick version of https://stats.wikimedia.org/v2/#/en.wikipedia.org/contributing/editors/normal|table|2018-04-01~2019-04-01|activity_level~1..4-edits*5..24-edits*25..99-edits*100..-edits
active_editors_by_month = []
36.times do |i|
  month = i.months.ago.month
  year = i.months.ago.year
  active_editor_count = Revision.where('extract(month from date) = ?', month).where('extract(year from date) = ?', year).group('user_id').having('count(*) > 4').count.count
  active_editors_by_month << ["#{year}-#{month}-01", active_editor_count]
end
