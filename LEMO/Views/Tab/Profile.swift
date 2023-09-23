//
//  UserProfile.swift
//  LEMO
//
//  Created by Admin on 23.09.2023.
//

import SwiftUI

struct Profile: View {
    let firstName = UserDefaults.standard.string(forKey: user.firstName.rawValue)
    let lastName = UserDefaults.standard.string(forKey: user.lastName.rawValue)
    let email = UserDefaults.standard.string(forKey: user.email.rawValue)
    @Environment(\.presentationMode) var presentation
    
    @State var checkedOrderStatus = true
    @State var checkedPasswordChanges = true
    @State var checkedSpetialOffers = true
    @State var checkedNewsletters = true
    
    var body: some View {
        VStack {
            HStack {
                Button {
                } label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .resizable()
                        .foregroundColor(Color(hex:"#495e57"))
                        .frame(width: 35, height: 35)
                }
                Spacer()
                Image("Logo")
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding([.leading, .trailing])
            
            VStack(alignment: .leading) {
                ScrollView{
                    VStack(alignment: .leading) {
                        // Personal Info
                        Group {
                            
                            Text("Personal Information")
                                .font(Font.system(size: 18, weight: .bold))
                                .foregroundColor(Color(hex:"#333333"))
                                .padding([.leading, .trailing], 20)
                                .padding(.top, 12)
                                .padding(.bottom, 5)
                                .bold()
                            Text("Avatar")
                                .foregroundColor(Color(hex:"#afafaf"))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            HStack {
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                
                                Button("Change") {
                                    // "Change Info" code here
                                }
                                .font(Font.system(size: 16, weight: .medium))
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 10)
                                .foregroundColor(Color(hex:"#edefed"))
                                .background(Color(hex:"#495e57"))
                                .cornerRadius(7)
                                .padding(10)
                                
                                Button("Remove") {
                                    // "Remove Profile" code here
                                }
                                .font(Font.system(size: 16, weight: .medium))
                                .padding([.leading, .trailing])
                                .padding([.top, .bottom], 10)
                                .foregroundColor(Color(hex:"#495e57"))
                                .border(Color(hex:"#495e57"))
                                
                                Spacer()
                            }
                            .padding(.leading)
                        }
                        
                        // Texts
                        Group {
                            Text("First name")
                                .foregroundColor(Color(hex:"#afafaf"))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text(firstName ?? "")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(hex:"#afafaf"), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                            
                            Text("Last name")
                                .foregroundColor(Color(hex:"#afafaf"))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text(lastName ?? "")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(hex:"#afafaf"), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                            
                            Text("email")
                                .foregroundColor(Color(hex:"#afafaf"))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text(email ?? "")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(hex:"#afafaf"), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                            
                            Text("phonenumber")
                                .foregroundColor(Color(hex:"#afafaf"))
                                .bold()
                                .padding([.leading, .trailing], 20)
                            
                            Text("(217) 555-0113")
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(hex:"#afafaf"), lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 20)
                            
                        }
                        
                        // Notifications
                        Group {
                            Text("email notifications")
                                .font(Font.system(size: 18, weight: .bold))
                                .foregroundColor(Color(hex:"#333333"))
                                .padding([.leading, .trailing], 20)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                                .bold()
                            HStack{
                                Image(systemName: checkedOrderStatus ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedOrderStatus ? (Color(hex:"#495e57")) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedOrderStatus.toggle()
                                    }
                                Text("order statuses")
                                    .foregroundColor(Color(hex:"#333333"))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            HStack{
                                Image(systemName: checkedPasswordChanges ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedPasswordChanges ? (Color(hex:"#495e57")) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedPasswordChanges.toggle()
                                    }
                                Text("password changes")
                                    .foregroundColor(Color(hex:"#333333"))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            HStack{
                                Image(systemName: checkedSpetialOffers ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedSpetialOffers ? (Color(hex:"#495e57")) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedSpetialOffers.toggle()
                                    }
                                Text("spetial offers")
                                    .foregroundColor(Color(hex:"#333333"))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            HStack{
                                Image(systemName: checkedNewsletters ? "checkmark.square.fill" : "square")
                                    .foregroundColor(checkedNewsletters ? (Color(hex:"#495e57")) : Color.secondary)
                                    .onTapGesture {
                                        self.checkedNewsletters.toggle()
                                    }
                                Text("newsletter")
                                    .foregroundColor(Color(hex:"#333333"))
                            }
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                        }
                        
                        // Buttons
                        Group {
                            
                            VStack(alignment: .center){
                                Button("log out") {
                                    UserDefaults.standard.set(false, forKey: user.isLoggedIn.rawValue)
                                    self.presentation.wrappedValue.dismiss()
                                }
                                .font(Font.system(size: 16, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .padding([.top, .bottom], 10)
                                .foregroundColor(Color(hex:"#495e57"))
                                .background(Color(hex:"#f4cf14"))
                                .cornerRadius(7)
                                .padding(20)
                                
                                HStack {
                                    Button("Discard changes") {
                                        // "Discard changes" code here
                                    }
                                    .font(Font.system(size: 16, weight: .medium))
                                    .padding([.leading, .trailing])
                                    .padding([.top, .bottom], 10)
                                    .foregroundColor(Color(hex:"#495e57"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7)
                                            .stroke(Color(hex:"#495e57"), lineWidth: 1)
                                        )
                                    
                                    Button("Save changes") {
                                        // "Save changes" code here
                                    }
                                    .font(Font.system(size: 16, weight: .medium))
                                    
                                    .padding([.leading, .trailing])
                                    .padding([.top, .bottom], 10)
                                    .foregroundColor(Color(hex:"#edefed"))
                                    .background(Color(hex:"#495e57"))
                                    .cornerRadius(7)
                                    .padding(10)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color(hex:"#afafaf"), lineWidth: 1)
                        )
                }
               
            }
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color(hex:"#afafaf"), lineWidth: 1)
                )
        }
    }
}

struct Profile_Preview: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
