(deftemplate Enfermedad
    (slot id (type INTEGER))
    (slot nombre (type SYMBOL))
    (multislot signos (type SYMBOL) (allowed-symbols dolor fiebre tos cansancio))
    (multislot sintomas (type SYMBOL) (allowed-symbols dolor_de_cabeza nauseas escalofrios))
)

(deffacts BaseConocimientos
    (Enfermedad (id 1) (nombre gripe) (signos fiebre cansancio) (sintomas dolor_de_cabeza tos))
    (Enfermedad (id 2) (nombre influenza) (signos congestion nauseas) (sintomas escalofrios dolor_muscular))
    (Enfermedad (id 3) (nombre diabetes) (signos cicatrizacion_deficiente polifagia) (sintomas polidipsia poliuria))
    (Enfermedad (id 4) (nombre alergia) (signos erupcion hinchazon) (sintomas dificultad_respirar picazon))
    (Enfermedad (id 5) (nombre intoxicacion_alimentaria) (signos fiebre inflamacion_abdominal) (sintomas nauseas dolor_estomacal))
    (Enfermedad (id 6) (nombre asma) (signos silibancias tos) (sintomas opresion_pecho dificultad_respirar))
)

(defrule ConsultarEnfermedad
    =>
    (printout t "Por favor, ingrese el ID de la enfermedad que desea consultar: ")
    (bind ?id (read))
    (Enfermedad (id ?id) (nombre ?nombre) (signos $?signos) (sintomas $?sintomas))
    =>
    (printout t "------------------------------------" crlf)
    (printout t "Enfermedad encontrada: " ?nombre " (ID: " ?id ")" crlf)
    (printout t "------------------------------------" crlf)
    (printout t "Signos: " ?signos crlf)
    (printout t "Síntomas: " ?sintomas crlf)
    (printout t "------------------------------------" crlf)
)

(defrule EliminarEnfermedad
    =>
    (printout t "Por favor, ingrese el ID de la enfermedad que desea eliminar: ")
    (bind ?id (read))
    (Enfermedad (id ?id))
    =>
    (printout t "Eliminando enfermedad con ID: " ?id crlf)
    (retract (Enfermedad (id ?id)))
)

(defrule ConsultarEnfermedadPorNombre
    =>
    (printout t "Por favor, ingrese el nombre de la enfermedad que desea consultar: ")
    (bind ?nombre (read))
    (Enfermedad (nombre ?nombre))
    =>
    (printout t "Enfermedad encontrada por nombre: " ?nombre crlf)
)