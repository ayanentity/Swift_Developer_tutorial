//
//  ContentView.swift
//  MicroAdventures
//
//  Created by 仲里絢音 on 2026/04/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // Center coordinate for the marker and camera
    private let centerCoordinate = CLLocationCoordinate2D(latitude: 35.681236, longitude: 139.767125) // 東京駅あたりの例

    // Map camera position bound to the view state
    @State private var camera: MapCameraPosition = .automatic

    // Filtering state
    @State private var selectedCategories: Set<String> = []
    @State private var selectedEfforts: Set<String> = []

    // Example options (replace with real data later if needed)
    private let allCategories: [String] = ["Nature", "Urban", "Water", "Night", "Food"]
    private let allEfforts: [String] = ["Easy", "Medium", "Hard"]

    var body: some View {
        NavigationStack {
            Map(position: $camera) {
                // Marker at the center coordinate
                Marker("目的地", coordinate: centerCoordinate)
            }
        
            .mapControls { }
            .ignoresSafeArea()
            .navigationTitle("MicroAdventure")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                // Center the camera on the marker with a reasonable zoom (region span)
                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                let region = MKCoordinateRegion(center: centerCoordinate, span: span)
                camera = .region(region)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        // Categories section
                        Section("Categories") {
                            Button("Select All") {
                                selectedCategories = Set(allCategories)
                            }
                            Button("Clear All") {
                                selectedCategories.removeAll()
                            }
                            Divider()
                            ForEach(allCategories, id: \.self) { category in
                                let isOn = selectedCategories.contains(category)
                                Button {
                                    if isOn { selectedCategories.remove(category) } else { selectedCategories.insert(category) }
                                } label: {
                                    Label(category, systemImage: isOn ? "checkmark.circle.fill" : "circle")
                                }
                            }
                        }

                        // Effort section
                        Section("Effort Levels") {
                            Button("Select All") {
                                selectedEfforts = Set(allEfforts)
                            }
                            Button("Clear All") {
                                selectedEfforts.removeAll()
                            }
                            Divider()
                            ForEach(allEfforts, id: \.self) { effort in
                                let isOn = selectedEfforts.contains(effort)
                                Button {
                                    if isOn { selectedEfforts.remove(effort) } else { selectedEfforts.insert(effort) }
                                } label: {
                                    Label(effort, systemImage: isOn ? "checkmark.circle.fill" : "circle")
                                }
                            }
                        }
                    } label: {
                        Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
