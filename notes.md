Model
    Parent/User
        has many events, through school
        belongs to school
        belongs to household
        boolean (admin/parent)
    
    Household
        has many students
        has many parents


    School
        has many users/parents
        has many students
        has many events

    Event
        belongs to school
        belongs to parent
    
    Student
        belongs to household

    Fundraiser 
        has many users
        has events

User
belongs_to school
belongs_to household
has_many fundraisers
has_many tasks
has_many expenses	

		   School
has_many households
has_many users, through households
has_many fundraisers
has_many tasks, through fundraisers

		Fundraiser
belongs_to school
has_many tasks
has_many households
has_many users, through households

		Expense
belongs_to user
belongs_to fundraiser
belongs_to task

		   Task
belongs_to user
belongs_to fundraiser
belongs_to school
has_many expenses

		   Household
has_many users
has_many students

		   Student
belongs_to school
belongs_to household