//

import SwiftUI

struct Activity {
    let name: String
    let imageName: String
}

struct ContentView: View {
    
    @ObservedObject var mainViewModel: MainViewModel
    //
    //    @State private var fact: String = "Get Fact"
        @State private var isLoading = false
    
    let activities: [Activity] = [
        Activity(name: "coach and player", imageName: "football1"),
        Activity(name: "touchdown", imageName: "football2"),
        Activity(name: "huddle", imageName: "football3"),
        Activity(name: "catch", imageName: "football4"),
        Activity(name: "play over", imageName: "football5"),
        Activity(name: "kickoff", imageName: "football6"),
        Activity(name: "play ready", imageName: "football7"),
        Activity(name: "receiver vs corner", imageName: "football8"),
        Activity(name: "1 and 2", imageName: "football9"),
        Activity(name: "Number 3", imageName: "football10"),
        Activity(name: "quaterback running", imageName: "football11"),
        Activity(name: "2 and 3", imageName: "football12"),
        Activity(name: "goalline", imageName: "football13")
    ]

    let colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

//    @State private var selected: Activity
    @State private var selected: Activity = Activity(name: "placeholder", imageName: "football1") // or any default
    @State private var id = 1

//    init() {
//        
//        self.mainViewModel = .init()
//        
//        // Pick a random activity as the initial selected one
//        _selected = State(initialValue: activities.randomElement()!)
//    }

    var body: some View {
        VStack {
            Text("Why not try…")
                .font(.largeTitle.bold())
            
            Spacer()
            
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image(selected.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 370)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    )

                Text("\(selected.name)!")
                    .font(.title)
            } //end of inner Vstack
            .transition(.slide)
            .id(id)
            
            Spacer()
            
            Button("Try again") {
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? activities[0]
                    id += 1
                }
            } //end of button
            .buttonStyle(.borderedProminent)
            
            
            Button{
                                mainViewModel.signOut()
                            } label:{
            
                                Text("Sign out")
                                    .padding()
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .background(Color.blue)
                                    .cornerRadius(11)
                            }.padding()
            
            
            
            
//            ProfileView(profileViewModel: mainViewModel)
            
            
        } //end of outer Vstack
        
        .onAppear {
            selected = activities.randomElement() ?? selected
        }
        
        
    }
} //content view ends here



struct ProfileView: View {

    @ObservedObject var profileViewModel: MainViewModel

    var body: some View {

        ZStack{
            Color.green

            UserProfileView(mainViewModel: profileViewModel)
        }

    }
}



#Preview {
        ContentView(mainViewModel: MainViewModel())

//   ContentView()
}













//  ContentView.swift
//  GuessWhat
//
//  Created by Joshua Brown on 9/11/25.
//

//
//  ContentView.swift

//import SwiftUI
//
//
////Fact Model
//struct Fact: Codable{
//    let text: String
//}
//
//
//struct ContentView: View {
//    
//   @ObservedObject var mainViewModel: MainViewModel
//    
//    @State private var fact: String = "Get Fact"
//    @State private var isLoading = false
//    
//    
//    var body: some View {
//        
//        TabView{
//        
//        ZStack {
//            
//            Color.green.ignoresSafeArea()
//            
//            VStack{
//                Image(systemName: "figure.archery")
//                    .resizable()
//                    .frame(width: 150, height: 150)
//            
//            Text(fact)
//                    .font(.title2)
//                    .multilineTextAlignment(.center)
//                    .foregroundStyle(.black)
//                    .padding()
//            
//            Button(action: fetchFact){
//                Text("Get new fact")
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .foregroundColor(.blue)
//                    .background(Color.black)
//                    .cornerRadius(10)
//            }.padding(.horizontal)
//            
//                if isLoading{
//                    ProgressView()
//                }
//                
////                Button{
////                    mainViewModel.signOut()
////                } label:{
////
////                    Text("Sign out")
////                        .padding()
////                        .font(.headline)
////                        .foregroundColor(.white)
////                        .background(Color.red)
////                        .cornerRadius(10)
////                }.padding()
//             
//                
//                
//                Button{
//                    mainViewModel.signOut()
//                } label:{
//
//                    Text("Sign out")
//                        .padding()
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .background(Color.blue)
//                        .cornerRadius(11)
//                }.padding()
//
//                
//                
//                
//                
//        }
//            
//        
//        }.tabItem{
//            Image(systemName: "house.fill")
//            Text("Home")
//        }
//            
//        ProfileView(profileViewModel: mainViewModel)
//                .tabItem {
//                    Image(systemName: "person.circle.fill")
//                    Text("Profile")
//                }
//            
//      } //end of tabview
//    } //end of body
//    
//   
//    //Function goes below here
//    func fetchFact(){
//        
//        isLoading = true
//        
//        let url = URL(string: "https://uselessfacts.jsph.pl/random.json?language=en")!
//        
//        URLSession.shared.dataTask(with: url){ data,
//            response, error in
//            DispatchQueue.main.async{
//                isLoading = false
//            }
//            
//            guard let data = data, error == nil else{
//                DispatchQueue.main.async{
//                    fact = "failed to load"
//                }
//                
//                return
//            }
//            
//            do{
//               let decoded = try JSONDecoder().decode(Fact.self, from: data)
//                
//                DispatchQueue.main.async{
//                    fact = decoded.text
//                }
//                
//            }catch{
//                DispatchQueue.main.async{
//                    fact = "failed to parse fact"
//                }
//            }
//            
//        }
//        .resume()
//    }
//    
//    
//    
//    
//}
//
//
////New struct for profileView
//struct ProfileView: View {
//    
//    @ObservedObject var profileViewModel: MainViewModel
//    
//    var body: some View {
//       
//        ZStack{
//            Color.green
//            
//            UserProfileView(mainViewModel: profileViewModel)
//        }
//        
//    }
//}



//#Preview {
//    ContentView(mainViewModel: MainViewModel())
//}
