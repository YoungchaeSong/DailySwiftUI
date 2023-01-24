//
//  SwipeCardView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/19.
//

import SwiftUI

struct User: Hashable, CustomStringConvertible {
    var id: Int
    
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
    
}

struct SwipeCardView: View {
    
    @State var users: [User] = [
        User(id: 0, firstName: "Cindy", lastName: "Jones", age: 23, mutualFriends: 4, imageName: "person_1", occupation: "Coach"),
        User(id: 1, firstName: "Mark", lastName: "Bennett", age: 27, mutualFriends: 0, imageName: "person_2", occupation: "Insurance Agent"),
        User(id: 2, firstName: "Clayton", lastName: "Delaney", age: 20, mutualFriends: 1, imageName: "person_3", occupation: "Food Scientist"),
        User(id: 3, firstName: "Brittni", lastName: "Watson", age: 19, mutualFriends: 4, imageName: "person_4", occupation: "Historian"),
        User(id: 4, firstName: "Archie", lastName: "Prater", age: 22, mutualFriends: 18, imageName: "person_5", occupation: "Substance Abuser Counselor"),
        User(id: 5, firstName: "James", lastName: "Braun", age: 24, mutualFriends: 3, imageName: "person_6", occupation: "Marketing Manager"),
        User(id: 6, firstName: "Danny", lastName: "Savage", age: 25, mutualFriends: 16, imageName: "person_7", occupation: "Dentist"),
        User(id: 7, firstName: "Chi", lastName: "Pollack", age: 29, mutualFriends: 9, imageName: "person_8", occupation: "Recreational Therapist"),
        User(id: 8, firstName: "Josue", lastName: "Strange", age: 23, mutualFriends: 5, imageName: "person_9", occupation: "HR Specialist"),
        User(id: 9, firstName: "Debra", lastName: "Weber", age: 28, mutualFriends: 13, imageName: "person_10", occupation: "Judge"),
    ]
    
    private func getCardWidth(_ geometry: GeometryProxy, index: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - index ) * 10
        return geometry.size.width - offset
    }
    
    private func getCardOffset(_ grometry: GeometryProxy, index: Int) -> CGFloat {
        return CGFloat(users.count - 1 - index ) * 10
    }
    
    private var maxID: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    DateView()
                    ZStack {
                        ForEach(self.users, id: \.self) { user in
                            // ~= : 대상이 특정 범위에 속하는지 범위를 체크하는 연산자
                            /**
                             - Example 1: 숫자 5가 0~ 10 사이일 때 10을 곱해주려면 이렇게 할 수 있습니다.
                             var n = 5
                             if 0..<10 ~= n {
                               n *= 10
                             }

                             print(n) // 50
                             
                             - Example 2: str이 "a"~"z"를 포함하는지 찾고 싶다면
                             func checkLowercase(str: String) -> Bool {
                               if "a"..."z" ~= str {
                                 // str contain lowercased alpabet
                                 return true
                               } else {
                                 // Not found lowercased alpabet
                                 return false
                               }
                             }

                             checkLowercase(str: "a") // true
                             checkLowercase(str: "aA") // true
                             checkLowercase(str: "A") // false
                             */
                            if (self.maxID - 3)...self.maxID ~= user.id {
                                CardView(user: user) { user in
                                    self.users.removeAll { $0.id == user.id }
                                }
                                .animation(.spring(), value: users)
                                .frame(width: self.getCardWidth(geometry, index: user.id), height: 400)
                                .offset(x: 0, y: self.getCardOffset(geometry, index: user.id))
                                
                            }
                        }
                        
                    }
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct DateView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Friday, 10th January")
                        .font(.title)
                        .bold()
                    Text("Today")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct SwipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardView()
    }
}
