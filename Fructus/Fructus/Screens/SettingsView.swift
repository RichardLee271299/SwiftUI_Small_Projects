//
//  SettingsView.swift
//  Fructus
//
//  Created by Kirill Sytkov on 02.07.2022.
//

import SwiftUI

struct SettingsView: View {
   //MARK: - Properties
   @Environment(\.presentationMode) var presentationMode
   @AppStorage("isOnboarding") var isOnboarding = false
   
   //MARK: - Body
   var body: some View {
      NavigationView {
         ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:20) {
               //MARK: - Section 1
               GroupBox(label:
                           SettingLabelView(labelText: "Fructus", labelImage: "info.circle")
               ) {
                  
                  Divider().padding(.vertical, 4)
                  HStack(alignment: .center, spacing: 10) {
                     Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(9)
                     
                     Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                        .font(.footnote)
                  }
               }
               
               //MARK: - Section 2
               GroupBox(label:
                           SettingLabelView(labelText: "Customization", labelImage: "paintbrush")
               ) {
                  Divider().padding(.vertical, 4)
                  
                  Text("If you wish, you car restart athe application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                     .font(.footnote)
                     .padding(.vertical, 8)
                     .frame(minHeight: 60)
                     .layoutPriority(1)
                     .multilineTextAlignment(.leading)
                  
                  Toggle(isOn: $isOnboarding) {
                     if isOnboarding {
                        Text("Restarted".uppercased())
                           .fontWeight(.bold)
                           .foregroundColor(Color.green)
                     } else {
                        Text("Restart".uppercased())
                           .fontWeight(.bold)
                           .foregroundColor(Color.secondary)
                     }
                  }
                  .padding()
                  .background(
                     Color(UIColor.tertiarySystemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                  )
                  
               }
               
               //MARK: - Section 3
               GroupBox(label:
                           SettingLabelView(labelText: "Application", labelImage: "apps.iphone")
               ) {
                  SettingsRowView(name: "Developer", content: "Kirill")
                  SettingsRowView(name: "Designer", content: "Robert Petras")
                  SettingsRowView(name: "Compability", content: "iOS 14")
                  SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestionation: "swiftuimasterclass.com")
                  SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestionation: "twitter.com/robertpetras")
                  SettingsRowView(name: "SwiftUI", content: "2.0")
                  SettingsRowView(name: "Version", content: "1.1.0")
               }
            }// VSTACK
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems (
               trailing:
                  Button(action: {
                     presentationMode.wrappedValue.dismiss()
                  }) {
                     Image(systemName: "xmark")
                  }
            )
            .padding()
         }
      } // NAVIGATION
   }
}

//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView()
         .preferredColorScheme(.dark)
   }
}
