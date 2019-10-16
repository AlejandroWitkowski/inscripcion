class Materia{
	const property nombre
	const property correlativa = #{}
	const property inscriptos = #{}
	const property cupo = 30
	
	method hayCupo() = inscriptos.size() < 30
	
	method estaInscripto(alumno) = inscriptos.contains(alumno) 
	
	
	
	method inscribir(materia) {
	if (not self.puedeInscribirseA(materia)) {self.error("No se puede inscribir")}
	}
	
	if (not materia.hayCupo()) {self.error ("No hay cupo")}
	
	materiasInscripto.add(materia)
}

class Carrera{
	const property nombre
	const property materias = #{}
	
}