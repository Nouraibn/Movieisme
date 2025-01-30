import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()

    var body: some View {
        ZStack {
            Image("SignInBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -50)
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(1.9), Color.clear]),
                startPoint: .bottom, endPoint: .top
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Spacer()
                Text("Sign in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 1)
                
                Text("You'll find what you're looking for in the \n ocean of movies")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    // Email Field
                    CustomTextField(
                        title: "Email",
                        text: $viewModel.email,
                        error: viewModel.emailError ? "Invalid email" : nil
                    )
                    .padding(.horizontal, 40)
                    
                    // Password Field
                    CustomSecureField(
                        title: "Password",
                        text: $viewModel.password,
                        isPasswordVisible: $viewModel.isPasswordVisible,
                        error: viewModel.passwordError ? "Invalid password" : nil
                    )
                    .padding(.horizontal, 40)
                    
                    // Sign In Button
                    Button(action: {
                        viewModel.signIn()
                    }) {
                        Text("Sign in")
                            .font(.headline)
                            .frame(width: 328, height: 19)
                            .padding()
                            .background(Color.yellow1)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            .padding(.bottom, 20)
                    }
                    .padding(.top,30)
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.isSignedIn) {
            MoviesCenterView()
        }
    }
}

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var error: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.bottom, -1.0)
            TextField("Enter your \(title.lowercased())", text: $text)
                .padding()
                .background(Color.gray1.opacity(0.26))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(error != nil ? Color.red : Color.clear, lineWidth: 1)
                        .frame(height: 44)
                )
                .frame(width: 358, height: 44)
                .cornerRadius(8)
                .foregroundColor(.white)
                .accentColor(Color.yellow1)
            
            if let error = error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
        }
    }
}

struct CustomSecureField: View {
    let title: String
    @Binding var text: String
    @Binding var isPasswordVisible: Bool
    var error: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.bottom, 2.0)
            
            ZStack {
                if isPasswordVisible {
                    TextField("Enter your \(title.lowercased())", text: $text)
                        .padding()
                        .background(Color.gray1.opacity(0.26))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(error != nil ? Color.red : Color.clear, lineWidth: 1)
                                .frame(height: 44)
                        )
                        .frame(width: 358, height: 44)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .accentColor(Color.yellow1)
                } else {
                    SecureField("Enter your \(title.lowercased())", text: $text)
                        .padding()
                        .background(Color.gray1.opacity(0.26))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(error != nil ? Color.red : Color.clear, lineWidth: 1)
                                .frame(height: 44)
                        )
                        .frame(width: 358, height: 44)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .accentColor(Color.yellow1)
                }
                Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
                    .padding(.leading, 310.0)
                    .onTapGesture {
                        isPasswordVisible.toggle()
                    }
            }
            
            if let error = error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    SignInView()
}
