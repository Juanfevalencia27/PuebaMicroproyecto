


(deftemplate alimento
    (multislot nombre (type STRING))
    (slot precio (type STRING))
    
    (slot agua (type FLOAT))
    (slot proteina (type FLOAT))
    (slot glucidos (type FLOAT))
    (slot lipidos (type FLOAT))
    (slot valorCalorico (type FLOAT))
    (slot colesterol (type FLOAT))
    (slot hierro (type FLOAT))
    (slot calcio (type FLOAT))
    (slot magnesio (type FLOAT))
    (slot fosforo (type FLOAT))
    (slot potasio (type FLOAT))
    (slot sodio (type FLOAT))
    (slot VA (type FLOAT))
    (slot VB2 (type FLOAT))
    (slot VB6 (type FLOAT))
)

(defrule crear_alimento
    ?hecho <- (ingresar_alimento)
    =>
    (bind ?nombre (read))
    (bind ?precio (read))
    (bind ?agua (read))
    (bind ?proteina (read))
    (bind ?glucidos (read))
    (bind ?lipidos (read))
    (bind ?valorCalorico (read))
    (bind ?colesterol (read))
    (bind ?hierro (read))
    (bind ?calcio (read))
    (bind ?magnesio (read))
    (bind ?fosforo (read))
    (bind ?potasio (read))
    (bind ?sodio (read))
    (bind ?VA (read))
    (bind ?VB2 (read))
    (bind ?VB6 (read))
    (assert (usuario 
        (nombre ?nombre)
        (precio ?precio)
        (agua ?agua)
        (proteina ?proteina)
        (glucidos ?glucidos)
        (lipidos ?lipidos)
        (valorCalorico ?valorCalorico)
        (colesterol ?colesterol)
        (hierro ?hierro)
        (calcio ?calcio)
        (magnesio ?magnesio)
        (fosforo ?fosforo)
        (potasio ?potasio)
        (sodio ?sodio)
        (Va ?VA)
        (VB2 ?VB2)
        (VB6 ?VB6)
    )
    (retract ?hecho)
)

(defrule crear_usuario
    ?hecho <- (ingresar_usuario)
    =>
    (bind ?nombre (read))
    (bind ?apellido (read))
    (bind ?genero (read))
    (bind ?fecNacimiento (read))
    (bind ?peso (read))
    (bind ?estatura (read))
    (bind ?plan (read))
    (bind ?ocupacion (read))
    (bind ?presupuesto (read))
    
    (defglobal usuario
        ?*usernombre* = ?nombre
        ?*userapellido* = ?apellido
        ?*genero* = ?genero
        ?*fecNacimiento* = ?fecNacimiento
        ?*peso* = ?peso
        ?*estatura* = ?estatura
        ?*plan* = ?plan
        ?*ocupacion* = ?ocupacion
        ?*presupuesto* = ?presupuesto
    )
    (retract ?hecho)
)


//listar todos los alimentos

(defrule listar_alimentos
	?hecho <- (listar_alimentos)
	(alimento)
	=>
	(printout t "El hotel " ?h "esta situado en la ciudad: " ?c crlf)
)





(defrule calorias
    (calcular_calorias)
    =>
    (if (= ?*genero* 'F')
        then

    
    )

)