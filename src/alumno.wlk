import materias.*

class Alumno{
	const property nombre
	const materiasAprobadas = #{}
	const carreras = #{}
	
	
	method aprobo(materia, nota) {
	 if (self.tieneAprobado(materia)) {self.error("No se puede aprobar dos veces la misma materia")}
	 
	materiasAprobadas.add(new MateriaAprobada(materia = materia, alumno = self, nota = nota))
	}
	
	method cantidadAprobadas() = materiasAprobadas.size()
	
	method promedio() = materiasAprobadas.sum({aprobada => aprobada.nota()})/self.cantidadAprobadas()
	
	method tieneAprobado(materia) = materiasAprobadas.any({aprobada => aprobada.materia() == materia})
	
	method todasLasMaterias() = carreras.flatmap({carrera => carrera.materias()}).asSet()
	
	method puedeInscribirseA(materia) =
		self.todasLasMaterias().contains(materia) and 
		not self.tieneAprobado(materia) and 
		not self.EstaInscripto(materia) and 
		self.aproboCorrelativa(materia)
		
	method estaInscripto(materia) = materia.estaInscripto(self) 
	
	method aproboCorrelativa(materia) = materia.correlativa.all({mat => self.tieneAprobado(mat)})
	
	
}

class MateriaAprobada {
	const property materia
	const property alumno
	const property nota
}
