//
//  Friend.swift
//  Birthdays
//
//  Created by Justin Hold on 4/25/24.
//

import Foundation
import SwiftData

@Model
class Friend {
	let name: String
	let birthday: Date
	
	init(name: String, birthday: Date) {
		self.name = name
		self.birthday = birthday
	}
	
	// computed property to calculate
	// if friends birthday is today
	var isBirthdayToday: Bool {
		Calendar.current.isDateInToday(birthday)
	}
}
