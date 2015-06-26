admin = User.new(
	name: 'Admin Kelly',
	email: 'kellyobriant@gmail.com',
	password: 'luminary'
	)
admin.skip_confirmation!
admin.save!
users = User.all

4.times do 
	button = Button.create!(
		title: 'Tag!',
		hits: 0,
		user_id: users.sample.id
		)
end
