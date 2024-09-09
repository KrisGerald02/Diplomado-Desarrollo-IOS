import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    @State private var showSuccessAlert = false
    
    private let correctUsername = "KrisGerald"
    private let correctPassword = "kris123"
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo de pantalla
                Image("BackgroundLogIn")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // Título
                    Text("Bienvenido a")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    
                    // Título en cursiva
                    Text("NicaDestiny")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .italic()
                    
                    Spacer()
                    
                    VStack(spacing: 12) {
                    
                        Text("Username")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 75)
                        
                   
                        TextField("Ingrese su usuario", text: $username)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .padding(.horizontal, 75)
                        
                     
                        Text("Password")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 75)
                        
              
                        SecureField("Ingrese su contraseña", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .padding(.horizontal, 75)
                        
                    
                        Button(action: login) {
                            Text("Log In")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .padding(.horizontal, 180)
                        }
                    }
                    .padding(.vertical)
                    
                    Spacer()
                }
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showSuccessAlert) {
                Alert(title: Text("Success"), message: Text("Login successful!"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func login() {
        if username == correctUsername && password == correctPassword {
            showSuccessAlert = true
            isLoggedIn = true
            navigateToHome()
        } else {
            alertMessage = "Usuario o contraseña incorrectos"
            isShowingAlert = true
        }
    }
    
    private func navigateToHome() {
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.modalPresentationStyle = .fullScreen
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController?.present(navigationController, animated: true, completion: nil)
        }
    }
    
    
    // Vista previa del Iphone
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 15 Pro")
        }
    }
}
