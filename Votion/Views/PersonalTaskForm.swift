//
//  PersonalTaskForm.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import SwiftUI

struct PersonalTaskForm: View {
    @State private var name: String = ""
    @State private var startDate: Date = Date()
    @State private var isDatePickerShown: Bool = false
    @State private var description: String = ""
        
    @State private var selectedDateString: String = ""
        
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "person")
                        .padding(.bottom, 10)
                    Text("Create Personal Task")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 100)
                .font(.largeTitle)
                Spacer()
            }
            Text("Task name")
                .font(.headline)
            
            TextField("Enter task name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Start Date")
                .font(.headline)
            
            TextField("Select start date", text: $selectedDateString, onEditingChanged: { isEditing in
                if isEditing {
                    isDatePickerShown = true
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onTapGesture {
                isDatePickerShown = true
            }
            .padding(.bottom, 8)
            
            Text("Description")
                .font(.headline)
            
            TextEditor(text: $description)
                .frame(height: 100)
                .border(Color.gray, width: 1)
            HStack {
                Spacer()
                SubmitButton(action: createPageInNotion)
                Spacer()
            }
        }
        .foregroundColor(.black)
        .padding()
        .overlay(
            Group {
                if isDatePickerShown {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isDatePickerShown = false
                        }
                    
                    VStack {
                        Spacer()
                        
                        DatePicker("", selection: Binding(
                            get: {
                                let formatter = DateFormatter()
                                formatter.dateStyle = .medium
                                return formatter.date(from: selectedDateString) ?? Date()
                            },
                            set: { date in
                                let formatter = DateFormatter()
                                formatter.dateStyle = .medium
                                selectedDateString = formatter.string(from: date)
                                startDate = date
                            }
                        ), displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding()
                    }
                }
            }
        )
    }
}

struct PersonalTaskForm_Previews: PreviewProvider {
    static var previews: some View {
        PersonalTaskForm()
    }
}
