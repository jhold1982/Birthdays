//
//  ContentView.swift
//  Birthdays
//
//  Created by Justin Hold on 4/25/24.
//

import SwiftUI

struct ContentView: View {
	
	// MARK: - PROPERTIES
	@State private var friends: [Friend] = [
		Friend(name: "Lindsay", birthday: Date(timeIntervalSince1970: 0)),
		Friend(name: "Oliver", birthday: .now),
		Friend(name: "Marigold", birthday: .now)
	]
	
	@State private var newName: String = ""
	@State private var newDate: Date = Date.now
	
	
	// MARK: - VIEW BODY
    var body: some View {
        NavigationStack {
			List(friends, id: \.name) { friend in
				HStack {
					Text(friend.name)
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
						
						// add the newFriend to the array of Friends (Append)
						friends.append(newFriend)
						newName = ""
						newDate = Date.now
					}
					.bold()
				}
				.padding()
				.background(.bar)
			}
        }
    }
}

#Preview {
    ContentView()
}
