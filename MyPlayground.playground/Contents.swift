import Foundation

let string = "12:30"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "HH:mm"
let date = dateFormatter.date(from: string)


let str = date?.formatted(date: .omitted, time: .shortened)
str?.dropLast(3)
