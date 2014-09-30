class CreateStudent < ActiveRecord::Migration
	def self.up
		#insert schema.rb here
	

		  create_table "courses", force: true do |t|
		    t.string "name", limit: 128
		    t.string "code", limit: 128, null: false
		  end

		  create_table "students", force: true do |t|
		    t.string  "name"
		    t.string  "picture"
		    t.integer "age"
		  end

		  create_table "students_courses", force: true do |t|
		    t.integer "student_id"
		    t.integer "course_id"
		  end

		
	end

	def self.down
		#drop all the tables if you really need
		# to support migration back to version 0
	end
end