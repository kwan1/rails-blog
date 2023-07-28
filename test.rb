EMAIL = "car@email.com"
PASSWORD = "1234"
CAR_VAULT = {make: {name: "Toyota", model: "Camry"}}

# DEFINE METHODS TOP PART OF CODE
def welcome_message
    puts "Welcome to the car database."
end

def prompt_user_for_email
    puts "Please sign in to continue."
    print "Enter Email: "
    gets.chomp
end

def verify_user_email(user_email)
    if user_email != EMAIL
        puts "Invalid email"
        exit
    end
end

def prompt_user_for_password
    puts "Please enter your password: "
    gets.chomp
end

def verify_user_password(user_password)
    if user_password != PASSWORD
        puts "Incorrect Password"
        exit
    end
end

def greet_user(user_email)
        puts "Hello,#{user_email}."
        puts "What would you like to do?"
    end

def menu_options
        puts "1. Add a new car"
        puts "2. Retrieve an existing car"
        puts "3. Exit"
        
end
def get_user_menu
    gets.chomp
end

#ERROR HERE
def handle_user_selection(user_selection)
    case user_selection
    when "1"
        new_service = set_new_service_name
        set_make_for(new_service)
        set_model_for(new_service)

    when "2"
        requested_car = retrieve_car_name
        car_make = retrieve_car_make_for(requested_car)
        display_car_make(requested_car, car_make)
    when "3"
        exit_program
    else
    invalid_selection
    end

end

def set_new_service_name #make of the car
    print "Enter the type of vehicle: "
    new_service = gets.chomp
    CAR_VAULT[new_service.to_sym] = {}
    new_service
end

def set_make_for(service) 
    print "Please enter the make of the car: "
        new_service_username = gets.chomp
        CAR_VAULT[service.to_sym][:make] = new_service_username
        
end

def set_model_for(service) 
    print "Please enter model of the car: "
    new_user_model = gets.chomp
    CAR_VAULT[service.to_sym][:model] = new_user_model
end

def retrieve_car_name
    print "Please enter the make of the car: "
    gets.chomp
end

    def retrieve_car_make_for(make_name)
            CAR_VAULT[make_name.to_sym]
    end


    def display_car_make(make_name, car_make)
        puts "Here are the details for #{make_name}: "
        car_make.each do |key, val|
        puts "#{key}: #{val}}"
        end
        end

    def exit_program
        puts "Exiting program, see you again!"
            exit
        end

def invalid_selection
    puts "Invalid selection, exiting the program for security purposes."
    exit
end

#CALLING METHODS
welcome_message

#verify user email
user_email = prompt_user_for_email
verify_user_email(user_email)

#verify user password
user_password = prompt_user_for_password
verify_user_password(user_password)

#greet once they are all passed
greet_user(user_email)

#loop until user selects exits
loop do
menu_options
user_selection = get_user_menu
handle_user_selection(user_selection)
end