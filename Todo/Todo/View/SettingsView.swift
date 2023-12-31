//
//  SettingsView.swift
//  Todo
//
//  Created by Kirill Sytkov on 03.12.2022.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var iconSettings: IconNames
    
    //Theme
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    @State private var isThemeChanged = false
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .center) {
                //MARK: - Form
                Form {
                    // MARK: - SECTION 1
                    
                    Section(header: Text("Choose the app icon")) {
                      Picker(selection: $iconSettings.currentIndex, label:
                        HStack {
                          ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                              .strokeBorder(Color.primary, lineWidth: 2)
                            
                            Image(systemName: "paintbrush")
                              .font(.system(size: 28, weight: .regular, design: .default))
                              .foregroundColor(Color.primary)
                          }
                          .frame(width: 44, height: 44)
                          
                          Text("App Icons".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        } //: LABEL
                        
                      ) {
                        ForEach(0..<iconSettings.iconNames.count) { index in
                          HStack {
                            Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                              .renderingMode(.original)
                              .resizable()
                              .scaledToFit()
                              .frame(width: 44, height: 44)
                              .cornerRadius(8)
                            
                            Spacer().frame(width: 8)
                            
                            Text(self.iconSettings.iconNames[index] ?? "Blue")
                              .frame(alignment: .leading)
                          } //: HSTACK
                          .padding(3)
                        }
                      } //: PICKER
                        .onReceive([self.iconSettings.currentIndex].publisher.first()) { (value) in
                          let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                          if index != value {
                            UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                              if let error = error {
                                print(error.localizedDescription)
                              } else {
                                print("Success! You have changed the app icon.")
                              }
                            }
                          }
                      }
                    } //: SECTION 1
                      .padding(.vertical, 3)
                    
                    //MARK: - Section 2
                    Section {
                        List {
                            ForEach(themes, id:\.id) { item in
                                Button {
                                    self.theme.themeSettings = item.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                    self.isThemeChanged.toggle()
                                } label: {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(item.themeColor)
                                        
                                        Text(item.themeName)
                                    }
                                }//BUTTON
                                .tint(.primary)
                            }
                        }
                    } header: {
                        HStack {
                            Text("Choose the app theme")
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(themes[self.theme.themeSettings].themeColor)
                        }
                    }
                    .padding(.vertical, 3)
                    .alert(isPresented: $isThemeChanged) {
                        Alert(title: Text("SUCCESS!"), message: Text("App has been changed to the \(themes[self.theme.themeSettings].themeName). Now close and restart it!"), dismissButton: .default(Text("OK")))
                    }
                    
                    //MARK: - Section 3
                    Section {
                        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                        FormRowLinkView(icon: "play.rectangle", color: .green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
                    } header: {
                        Text("Follow us on social media")
                    }
                    .padding(.vertical, 3)

                    
                    //MARK: - Section 4
                    Section {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compability", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Kirill Sytkov")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0 ")
                    } header: {
                        Text("About the application")
                    }
                    .padding(.vertical, 3)

                }//FORM
                .listStyle(.grouped)
                .environment(\.horizontalSizeClass, .regular)
                
                
                //MARK: - Footer
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
            }//VSTACK
            .navigationTitle(Text("Settings"))
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("ColorBackground"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
        }//NAVIGATION VIEW
        .tint(themes[self.theme.themeSettings].themeColor)
        
        
    }
}


//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(IconNames())
    }
}
