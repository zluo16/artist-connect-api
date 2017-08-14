# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mike = User.create(first_name: 'Mike', last_name: 'Luo')
vera = User.create(first_name: 'Vera', last_name: 'Zago')
dave = User.create(first_name: 'Dave', last_name: 'Matthews')

band = Organization.create(name: 'Dave Matthews Band', organization_type: 'Band')
Ownership.create(owner: dave, owned_org: band, relation: 'Band Leader')

house = Location.create(locatable: mike, address: '2066 Crist Dr.', city: 'Los Altos', state: 'CA', zipcode: '94024')

Education.create(user: mike, school_name: 'Berklee College of Music')
Experience.create(user: mike, company_name: 'Google', title: 'CEO')
Skill.create(user: mike, skill: 'Being Awesome')

guitar = JobPosting.create(organization: band, title: 'Guitarist')
Application.create(user: mike, job_posting: guitar)
