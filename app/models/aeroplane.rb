class Aeroplane < ApplicationRecord
    has_many :flights
    has_many :passengers

    validates :model, presence: {message:": please enter model"}
    validates :business_rows, presence: {message:": please enter business rows"}
    validates :business_columns, presence: {message:": please enter business columns"}
    validates :economy_rows, presence: {message:": please enter economy"}
    validates :economy_columns, presence: {message:": please enter economy"}
    validates :first_class_rows, presence: {message:": please enter first class"}
    validates :first_class_columns, presence: {message:": please enter first class"}
    validates :business_base_fare, presence: {message:": please enter fare"}
    validates :economy_base_fare, presence: {message:": please enter fare"}
    validates :first_class_base_fare, presence: {message:": please enter fare"}

    before_save :calc_seats

   

     def calc_seats
         self.number_of_seats = (first_class_rows * first_class_columns) + (business_rows * business_columns) + (economy_rows * economy_columns)
     end
end
