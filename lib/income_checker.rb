# existing_records = Generator
#                    .where(export_condition)
#                    .where(['id < ? and preview = ? and process_name = ? and deleted = 0', id, preview, process_name])
#                    .order('id desc')
#                    .first

puts "Working"