//
//
//  OnbardingFlow
//
//  Created by 仲里絢音 on 2026/04/25.
//

import SwiftUI


struct FeaturesPage: View {
    var body: some View {
        VStack (spacing: 30) { // gap-30ptの指定
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill",
                        description: "A multiline description about a feature paired with the image on the left.")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
            Spacer()
        }
        .padding()
    }
}


#Preview {
    FeaturesPage()
        .frame(maxHeight: .infinity)
        //.background(Gradient(colors: gradientColors))
        //.foregroundStyle(.white)
}
