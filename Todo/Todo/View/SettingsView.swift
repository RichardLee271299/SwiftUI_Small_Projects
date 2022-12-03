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
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                //MARK: - Form
                Form {
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

        
    }
}


//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
