import SwiftUI

struct MoviesCenterView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Movies Center")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Image("userProfile")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Search Bar
                TextField("Search for Movie name , actors...", text: .constant(""))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                // High Rated Section
                Text("High Rated")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        MovieCardView(imageName: "topGun", title: "Top Gun", rating: "4.8 out of 5", genre: "Action", duration: "2 hr 9 min")
                    }
                    .padding(.horizontal)
                }
                
                // Drama Section
                SectionHeaderView(title: "Drama")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        MovieCardView(imageName: "shawshank", title: "Shawshank Redemption", rating: "4.9 out of 5", genre: "Drama", duration: "2 hr 22 min")
                        MovieCardView(imageName: "starIsBorn", title: "A Star is Born", rating: "4.5 out of 5", genre: "Drama", duration: "2 hr 15 min")
                    }
                    .padding(.horizontal)
                }
                
                // Comedy Section
                SectionHeaderView(title: "Comedy")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        MovieCardView(imageName: "worldsGreatestDad", title: "World's Greatest Dad", rating: "4.3 out of 5", genre: "Comedy", duration: "1 hr 39 min")
                        MovieCardView(imageName: "houseParty", title: "House Party", rating: "4.2 out of 5", genre: "Comedy", duration: "1 hr 40 min")
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct MovieCardView: View {
    let imageName: String
    let title: String
    let rating: String
    let genre: String
    let duration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 250)
                .cornerRadius(10)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 5)
            
            HStack {
                Text("⭐ \(rating)")
                    .foregroundColor(.yellow)
                Spacer()
            }
            .padding(.vertical, 2)
            
            Text("\(genre) • \(duration)")
                .foregroundColor(.gray)
        }
        .frame(width: 180)
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Spacer()
            Text("Show more")
                .foregroundColor(.yellow)
                .font(.subheadline)
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

#Preview {
    MoviesCenterView()
}
