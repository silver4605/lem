//
//  MainView.swift
//  LEMO
//
//  Created by Admin on 23.09.2023.
//

import SwiftUI

struct MainView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    @State var showingAlert = false

    var body: some View {
        NavigationView {
            VStack {
                Image("Logo").padding(.bottom, 20)
                ZStack{
                    Rectangle().foregroundColor(Color(hex: "#495e57"))
                    VStack(){
                        HStack{
                            Text("Little Lemon")
                                .foregroundColor(Color(hex: "#ffff0a"))
                                .font(Font.custom("Georgia", size: 45))
                                .bold()
                                .padding([.leading], 20)
                            Spacer()
                        }
                        .frame(height: 60)
                        
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Chicago")
                                    .foregroundColor(Color(hex: "#ffffff"))
                                    .font(Font.custom("Georgia", size: 35))
                                    .fontWeight(.bold)
                                    .frame(height: 30)
                                
                                Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                    .foregroundColor(Color(hex: "#ffffff"))
                                    .font(Font.system(size: 16, weight: .medium))

                            }
                            Rectangle()
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                Image("Hero image")
                                    .resizable()
                                    .scaledToFill()
                                )
                                .clipShape(Rectangle())
                                .cornerRadius(15)
                                .frame(width: 150, height: 150)
                        }
                        .padding([.leading, .trailing])
                        .padding(.bottom, 20)
                    }
                    
                }
                .frame(height: 240)
                
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }

                    TextField("firstName", text: $firstName)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.leading, .trailing, .top])

                    TextField("lastName", text: $lastName)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing])
                
                    TextField("email", text: $email)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing])
                        .padding([.bottom],20)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                }
                
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: user.firstName.rawValue)
                        UserDefaults.standard.set(lastName, forKey: user.lastName.rawValue)
                        UserDefaults.standard.set(email, forKey: user.email.rawValue)
                        UserDefaults.standard.set(true, forKey: user.isLoggedIn.rawValue)
                        isLoggedIn = true
                        
                    } else {
                        showingAlert.toggle()
                    }
                }
                .font(Font.system(size: 18, weight: .medium))
                .frame(width: 150)
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 10)
                .foregroundColor(Color(hex: "#ffffff"))
                .background(Color(hex: "#495e57"))
                .cornerRadius(10)
                Spacer()
            } .onAppear {
                if UserDefaults.standard.bool(forKey: user.isLoggedIn.rawValue) {
                    isLoggedIn = true
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Warning"),
                message: Text("Make sure you fill in all fields"),
                dismissButton: .default(Text("OK"))
            )
        }
      
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


