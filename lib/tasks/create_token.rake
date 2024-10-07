desc 'create token for graphql testing purpose'
task create_token: :environment do
  token = JwtHelper.encode({user_id: AdminUser.first.id}, 1.year.from_now)
  puts token
end