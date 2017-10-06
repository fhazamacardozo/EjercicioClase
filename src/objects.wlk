
class Agresion {
	var palabrasUtilizadas = []
	var lugar
	var efectuador
	var elementoUtilizado
	var palabrasInaceptables=[]
	constructor(p,l,e){
		palabrasUtilizadas=p
		lugar=l
		efectuador=e
	}
	constructor(p,l,e,eU){
		palabrasUtilizadas=p
		lugar=l
		efectuador=e
		elementoUtilizado=eU
	}
	
	method esFisico()=elementoUtilizado!=null
	
	method esGrave(){
		return not(palabrasUtilizadas.intersection(palabrasInaceptables).isEmpty()) || not elementoUtilizado.isEmpty()
	}
	method esIgnea(){
		return elementoUtilizado=="combustible" || palabrasUtilizadas.contains("fuego")		
	}
	
	method agresor()=efectuador
	
}

class Persona{
	var agresiones=[]
	var vinculosFamiliares=[]
	var actitud
	var nivelDeTolerancia
	constructor(ag,vF,ac,nT){
		agresiones.addAll(ag)
		vinculosFamiliares.addAll(vF)
		actitud=ac
		nivelDeTolerancia=nT
	}
	
	method tieneMiedo(){
		return agresiones.size()>3
	}
	method deberiaHacerDenuncia(agresion){	
		if(agresion.esGrave() && vinculosFamiliares.contains(agresion.agresor())){
			if (actitud== "militante"){
				return true
			}
			else if (self.tieneMiedo()) {
				return false
			}
			else if (actitud=="paciente"){
				return (agresiones.filter({unaAgresion=>unaAgresion.agresor()== agresion.agresor()}).size())>nivelDeTolerancia
			}
			else if(actitud=="aguerrida"){
				return agresiones.filter({unaAgresion=>unaAgresion.esGrave()&& vinculosFamiliares.contains(unaAgresion.agresor())}).size()>0
			}
			else return false
		}
		else{
			return false
		}	
	
	}
}

