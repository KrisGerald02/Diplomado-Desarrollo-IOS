import UIKit

//Todas las clases que esten vinculadas al protocolo estan forzadas a hacer la funcion que esta contenida por el protocolo
protocol DoctorRepresentable {
    func checkPerson()
}

class Hospital {
    let doctor: DoctorRepresentable
    let name: String
    
    init(doctor: DoctorRepresentable, name: String){
        self.doctor = doctor
        self.name = name
    }
    
    func check(){
        doctor.checkPerson()
    }
}

class Andres: DoctorRepresentable{
    func checkPerson() {
        print("Estoy revisando un paciente al estilo Andres")
    }
}

class Juan: DoctorRepresentable{
    func checkPerson() {
        print("Estoy revisando un paciente al estilo Juan")
    }
}

let newHospital = Hospital(doctor: Andres(), name: "Militar")

newHospital.check()
