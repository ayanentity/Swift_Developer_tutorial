//
//  MomentView.swift
//  GratefulMoments
//
//  Created by 仲里絢音 on 2026/05/05.
//

import SwiftUI
import SwiftData

struct MomentView: View {
    @State private var showCreateMoment = false //flag
    @Query(sort: \Moment.timeStamp) private var moments: [Moment]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                pathItems
                    .frame(maxWidth: .infinity)
            }
            .overlay{ //リストが川の場合の表示
                if moments.isEmpty {
                    ContentUnavailableView {
                        Label("No moments yet!", systemImage: "exclamationmark.circle.fill")
                    } description: {
                        Text("Post a note or photo to start filling this space with gratitude.")
                    }
                }
            }
            
            
            
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    Button{
                        
                        showCreateMoment = true
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateMoment){
                        MomentEntryView()
                    }
                }
            }
            .navigationTitle("Grateful Moments")
        }
    }
    
    private var pathItems: some View{
        ForEach(moments){ moment in
            NavigationLink{
                MomentDetailView(moment: moment)
            } label: {
                Text(moment.title)
            }
        }
    }
}



#Preview("sampleData") {
    MomentView()
        .sampleDataContainer()
}

#Preview {
    MomentView()
        .modelContainer(for: [Moment.self])
}
