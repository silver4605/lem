//
//  Menu.swift
//  LEMO
//
//  Created by Admin on 23.09.2023.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("Logo")
                    .padding(.leading)
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding([.leading, .trailing])
        
            ZStack{
                Rectangle().foregroundColor(Color(hex: "#495e57"))
                VStack(){
                    HStack{
                        Text("Little Lemon")
                            .foregroundColor(Color(hex: "#ffff0a"))
                            .font(Font.custom("Georgia", size: 40))
                            .bold()
                            .padding([.leading], 20)
                        Spacer()
                    }
                    .frame(height: 45)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Chicago")
                                .foregroundColor(Color(hex: "#ffffff"))
                                .font(Font.custom("Georgia", size: 30))
                                .fontWeight(.medium)
                                .frame(height: 40)
                            Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .foregroundColor(Color(hex: "#ffffff"))
                                .font(Font.system(size: 16, weight: .medium))
                            
                            HStack {
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color(hex: "#9c9c9c"))
                                    .frame(width: 40, height: 40)
                                
                                TextField("Search", text: $searchText)
                                    .padding(10)
                                    .background(Color(hex: "#9c9c9c"))
                                    .frame(width: 150)
                                    .cornerRadius(20)
                            }
                            .padding(.top, 10)
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
            .frame(height: 300)
        
                VStack(alignment: .leading){
                    Text("Order Now!")
                        .font(Font.system(size: 18, weight: .bold))
                    
                    HStack {
                        Button("Starters") {

                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(hex: "#495e57"))
                        .background(Color(hex: "#f5f3f2"))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Mains") {
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(hex: "#495e57"))
                        .background(Color(hex: "#f5f3f2"))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Desserts") {
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(hex: "#495e57"))
                        .background(Color(hex: "#f5f3f2"))
                        .cornerRadius(13)
                        
                        Spacer()
                        
                        Button("Drinks") {
                        }
                        .font(Font.system(size: 16, weight: .bold))
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color(hex: "#495e57"))
                        .background(Color(hex: "#f5f3f2"))
                        .cornerRadius(13)

                    }
                    Divider()
                        .background(Color(hex: "#495e57"))
                        .padding(.top, 10)
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 10)
                
            
            
            // MenuItems

                NavigationView {
                    
                    FetchedObjects(predicate: buildPredicates(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                        ScrollView {
                            ForEach(dishes, id: \.self) { dish in
                                NavigationLink( destination: {
                                    Details(title: dish.title ?? "",
                                            price: dish.price ?? "",
                                            image: dish.image ?? "",
                                            description: dish.dishDescription ?? "")
                                }) {
                                    VStack {
                                        HStack{
                                            VStack(alignment: .leading) {
                                                Text(dish.title ?? "")
                                                .font(Font.system(size: 16, weight: .bold))
                                             
                                                .padding(.bottom, 2)
                                                .foregroundColor(Color(hex:"495e57"))
                                                Text(dish.dishDescription ?? "")
                                                    .multilineTextAlignment(.leading)
                                                    .font(Font.system(size: 16, weight: .regular))
                                                    

                                                    .foregroundColor(Color(hex:"495e57"))
                                                    .frame(width: 280, alignment: .leading )
                                                
                                                Text("$\(dish.price ?? "")")
                                                    .font(Font.system(size: 16, weight: .bold))
                                                   
                                                    .padding(.top, 2)
                                                    .foregroundColor(Color(hex:"495e57"))
                                            }
//                                            Spacer()
                                            //
                                            AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                                                switch phase {
                                                case .empty : Image(systemName: "exclamationmark.icloud")
                                                        .foregroundColor(Color(hex: "#495e57"))
                                                        
                                                case .success(let image):
                                                    image.resizable()
                                                        .scaledToFit()
                                                    
                                                case .failure(_):
                                                    Image(systemName: "exclamationmark.icloud")
                                                        .foregroundColor(Color(hex: "#495e57"))
                                                @unknown default:
                                                    Image(systemName: "exclamationmark.icloud")
                                                        .foregroundColor(Color(hex: "#495e57"))
                                                }
                                                
                                            }
                                            .frame(width: 70, height: 70)
                                            .frame(maxWidth: 150, maxHeight: 150)
                                        }
                                        Divider()
                                            .background(Color(hex: "#edefee"))
                                            .padding(.top, 5)
                                    }
                                    .padding([.leading, .trailing], 20)
                                }
                            }
                            
                        }
                        .scrollContentBackground(.hidden)
                        
                    }
                }
            
        } .task {
            await Api.shared.getMenuData(viewContext) 
        }
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicates() -> NSPredicate {
        searchText.isEmpty
        ? NSPredicate(value: true)
        : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}


