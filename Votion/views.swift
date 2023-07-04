//
//  views.swift
//  Votion
//
//  Created by Sam Dillard on 7/3/23.
//

import SwiftUI


struct ActionTile<Label>: View where Label: View {
    @State private var isPressed = false
    
    var action: () -> Void
    var label: () -> Label
    let color: Color

    init(action: @escaping () -> Void,
         color: Color,
         @ViewBuilder label: @escaping () -> Label) {
            self.action = action
            self.label = label
            self.color = color
    }
    
    var body: some View {
        Button(action: {
            isPressed = true
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
            }
        }) {
            label()
                .labelStyle(.titleAndIcon)
                .frame(
                    idealWidth: 200,
                    maxWidth: 250,
                    idealHeight: 150,
                    maxHeight: 200)
                .padding()
        }
        .font(.largeTitle .bold())
        .foregroundColor(.black)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .scaleEffect(isPressed ? 0.98: 1.0)
            )
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 2, y: 2)
        .padding()
    }
}

struct AppBar: View {
    let title: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .background(Color.black)
    }
}

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
                    Text("Create personal task")
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
        }
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalTaskForm()
    }
}

