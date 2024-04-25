//
//  ContentView.swift
//  Birthdays
//
//  Created by Justin Hold on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	
	// MARK: - PROPERTIES
	@Query private var friends: [Friend]
	@Environment(\.modelContext) var modelContext
	
	@State private var newName: String = ""
	@State private var newDate: Date = Date.now
	
	
	// MARK: - VIEW BODY
    var body: some View {
        NavigationStack {
			List(friends) { friend in
				
				HStack {
					
					if friend.isBirthdayToday {
						Image(systemName: "birthday.cake")
					}
					
					Text(friend.name)
						.bold(friend.isBirthdayToday)
					
					Spacer()
					
					Text(
						friend.birthday,
						format: .dateTime.month(.wide).day().year()
					)
					
				}
			}
			.navigationTitle("Birthdays")
			.safeAreaInset(edge: .bottom) {
				
				VStack(alignment: .center, spacing: 20) {
					
					Text("New Birthday")
						.font(.headline)
					
					DatePicker(
						selection: $newDate,
						in: Date.distantPast...Date.now,
						displayedComponents: .date
					) {
						
						TextField("Name", text: $newName)
							.textFieldStyle(.roundedBorder)
					}
					
					Button("Save") {
						// declare a constant called newFriend
						// that is equal to the data type of Friend
						// with name: newName and birthday: newDate
						// which come from the @State properties above
						let newFriend = Friend(name: newName, birthday: newDate)
						
						// add the newFriend to the array of Friends modelContext
						modelContext.insert(newFriend)
						newName = ""
						newDate = Date.now
					}
					.bold()
				}
				.padding()
				.background(.bar)
			}
			// swiftUI begins executing code in a Task before the view appears
			// example data
//			.task {
//				
//				modelContext.insert(
//					Friend(
//						name: "Lindsay",
//						birthday: .now
//					)
//				)
//				
//				modelContext.insert(
//					Friend(
//						name: "Justin",
//						birthday: Date(timeIntervalSince1970: 0)
//					)
//				)
//			}
        }
    }
}

#Preview {
    ContentView()
		.modelContainer(for: Friend.self, inMemory: true)
}
