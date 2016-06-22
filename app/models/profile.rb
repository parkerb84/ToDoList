class Profile < ActiveRecord::Base
  	belongs_to :user
  	validate :first_or_last
  	validates :gender, :inclusion => {:in => ['male', 'female']}
  	validate :gender_name_check

  	def first_or_last
  		if first_name.nil? && last_name.nil?
  			errors.add(:first_name, "Specify a first or a last name.")
  		end
  	end

  	def gender_name_check
  		if first_name == 'Sue' && gender == 'male'
  			errors.add(:first_name, 'cannot be a boy named Sue')
  		end
  	end

  	def self.get_all_profiles(start_year, test_year)
  		Profile.where(:birth_year => start_year..test_year).order('birth_year asc')
  	end
end
