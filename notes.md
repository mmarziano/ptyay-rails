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

