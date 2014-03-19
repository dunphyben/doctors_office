require 'pg'
require './lib/doctors'
require './lib/insurance'
require './lib/patients'
require './lib/specialty'
DB = PG.connect(:dbname => 'doc_data')


def main_menu

  puts "-"*40, "Main Menu:\n", "-"*40
  puts "\t1: View Doctors\n",
       "\t2: View Patients\n",
       "\tx: Exit Database\n"

  print "\nChoose an Option: "
  choice = gets.chomp

  case choice
  when '1'
    view_doctors
    main_menu
  when '2'
    view_patients
    main_menu
  when 'x'
    puts "\nGoodbye!\n\n"
  else
    puts "Invalid option!"
    main_menu
  end
end


  def view_doctors

    puts "*"*25, "Doctors\n", "-"*25
    puts "\t1: View all doctors (A-Z)\n",
         "\t2: View doctors by specialty\n",
         "\t3: View doctors by insurance company\n",
         "\t4: Search for a doctor by last name\n",
         "\t5: Add a doctor to the database\n",
         "\tx: Exit database"

    choice = gets.chomp

    case choice

    when '1'
      all_doctors
      main_menu
    when '2'
      doctors_by_specialty
      main_menu
    when '3'
      doctors_by_insurance_company
      main_menu
    when '4'
      search_doctor_last_name
      main_menu
    when '5'
      add_doctor
      main_menu
    when 'x'
      puts "Goodbye!"
    else
      puts 'Invalid Option!'
      view_doctors
    end
  end


  def all_doctors
  end

  def add_doctor
    puts "#"*15, "Enter the doctor name: \n", "#"*25
    name = gets.chomp
    new_doctor = Doctors.new(name)
    new_doctor.save
    puts "\n\nNew doctor added\n\n"

  end

  def view_patients
    # press p to view all patients (A-Z)
    # press d to view patients by doctor
  end

  def view_insurance
  end

  def select_doctor
    # press 1 to view all patients
    # press 2 to delete doctor
    # press 3 to edit doctor name
  end
main_menu
