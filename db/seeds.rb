# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(email: 'iniciado@gmail.com', password: 'sbabaji7', name: 'Cesar', surname: 'Valderrama')

p = Profile.create(name: 'admin')
p.save()
u.profiles << p

p = Profile.create(name: 'student')
p.save()
u.profiles << p

p = Profile.create(name: 'coordinator')
p.save()
u.profiles << p


lv = Level.create(name: "Fuego")

lv.save()
u.level = lv

ll = LessonLevel.create(name: "Atma")

Lesson.create(name: "La Búsqueda", lesson_level: ll, number_level: 1, number: 1, description: "<p>En entrega de lo que buscas. Respondiendo siempre a lo que como necesidad expones. Debes saber que donde menos lo creas está la Verdad y si se te dificulta llegar a ella, habla, pide, exige, pero no te quedes atrapado en la ignorancia, en el falso sueño, en la irrealidad.</p>
<p>Di, desde tu Ser más interno: Estoy preparando en mí la mejor forma de entrega y también de recibir. Estoy en la disposición de abrir en mí la puerta hacia mi interior.</p>")

Lesson.create(name: "El Encuentro", lesson_level: ll, number_level: 2, number: 2, description: "<p>Ante lo que buscas se te prepara, es como ir resolviendo lo que como enigma ves: el Ser que Eres. Reconocerte, sentirte, estimularte desde ti, es la primera etapa de lo que crees es una búsqueda interminable. Pero, tan sólo en el hecho de iniciarte para emprender esta aventura, ya estás en el camino exacto.</p>
<p>Dí con el entendimiento que te impulsa: 'Estoy expectante de mí. Me he ido sintiendo en lo que Soy, sólo busco lo que hay y es lo que espero encontrar. Nada más'</p>")

Lesson.create(name: "La Enseñanza", lesson_level: ll, number_level: 3, number: 3, description: "<p>Lo que buscas es que te faciliten más de tus propias herramientas para aprender. Pero... ¿cómo se obtiene eso? Y es cuando te propones iniciarte, determinando muy dentro de ti la intención exacta de aprendizaje.</p>
<p>Lo otro sería: ¿Quién puede ser capaz de impartirme la Enseñanza? Y allí siente tu bendición de dilucidar que existe alguien, a quien sabiamente has reconocido como el conducto preciso y preciado, que puede llevarte hasta la Verdad</p>")

Lesson.create(name: "El Aprendizaje", lesson_level: ll, number_level: 4, number: 4, description: "<p>Mis capacidades ahora se abren ante la magnitud de las Esferas que me asisten. Porque entiendo que he llegado a un estadio en el que he resuelto mucho y se gesta en mí el ímpetu -para nada forzado- de seguir.</p>
<p>Desde todo lo que soy y sé en mí, me conecto para alcanzar el valor y las formas más exactas de revelarme todo cuanto he aprendido de mí y tomar lo puro y así seguir. Sea lo que hoy contengo la base justa para todo cuanto hoy aprendo.</p>")

Lesson.create(name: "La Toma de Conciencia", lesson_level: ll, number_level: 5, number: 5, description: "<p>Sé que soy parte de un todo exacto y juego a la disgregación, cada vez de forma más consiente. Todo lo que de mi no sea voy a disiparlo, aceptando el juego supremo de empezar a creer en lo que soy.</p>
<p>Desde la forma que represento, me veo hoy siendo más capaz de producir en mí, aspectos que me permitan combatir mi inconsciencia, dada en forma de ignorancia y desamor. Me sujeto a la fuerza que sé soy, hoy y siempre.</p>")

Lesson.create(name: "El Desprendimiento", lesson_level: ll, number_level: 6, number: 6, description: "<p>Se trata mas que de una verdad. Y estaríamos sobre un supuesto que solo podemos comprender cuando nos alineamos a la entrega, antes no. Es ir descartando sensaciones, deseos, y la condición mas firme y arraigada: Ser humano.</p>
<p>Esto como dulce ofrenda hacia nosotros mismos frente a la contundente realidad de aceptarnos en la Nada, inequívoco concepto Divino que-tarde o temprano- descubrimos al experimentarnos profundamente. Es la base de la entrega a tono de devolución en gratitud y en servicio. Conducto imprescindible hacia la Eternidad.</p>")


Lesson.create(name: "La Conexión", lesson_level: ll, number_level: 7 , number: 7, description: "<p>El sentimiento de abandono se da en instantes de desolación, de angustia, de inconformidad o de negatividad. Pero basta recrearnos, en un instante también, en alguna premisa que nos permita sentir al Creador, y allí se restablece todo. Si tan sólo nos permitiéramos contener -en estos tiempos- más Fe en lo que somos y nos atreviéramos a parar el flujo negador de la existencia que se asoma a cada paso y en cada resquicio de este mundo visible.</p>
<p>Si desde nuestra capacidad nos estimuláramos a concederle a la Fuerza Divina el verdadero poder de habitarnos, no estaríamos en esta mala interpretación de la Verdad y todos estaríamos inmersos en el flujo infinito del Ser.</p>")

Lesson.create(name: "El Propósito", lesson_level: ll, number_level: 8, number: 8, description: "<p>Constante, constante, constante. Se trata de una progresión infinita de Creación. Lo que no tiene principio ni fin, pero se extiende como el poder de la Luz y el Amor en una Ley Absoluta. Si eso es lo que nos creó, nos expandió y lo que nos guía, ¿cómo es que hemos podido generaren nosotros el intimo y ultimo respiro de integrarnos?</p>
<p>El concepto de la Unidad es la propuesta de fusión y de comprensión existencial para alcanzar lo que se plantea como salvación-en un menor entendimiento- y reconocimiento en una formulación mas elevada. Seamos capaces de reafirmarnos al Uno como lo que existe en nuestro principio interno y alcancemos la Verdad.</p>")

Lesson.create(name: "Avanzar Hacia la Verdad", lesson_level: ll, number_level: 9, number: 9, description: "<p>Cada vez las opciones de Ser se sublimizan mas, es parte de este juego evolutivo. Es como si quisieras -ni mas ni menos- perfeccionarte. Es así. Ascender, trascender, liberarte palabras que vas a empezar a entender y a asumir para sumarlas a tu existencia.</p>
<p>Sabes que has pronunciado ya una proclama extensa, que por momentos puede sobrepasar tus fuerzas y hasta tu misma voluntad. Pero si algo debes considerar, es que te estas entregando con base en una asistencia pedida y enviada desde el UNO.</p>")

Lesson.create(name: "Realizar una Petición", lesson_level: ll, number_level: 10, number: 10, description: "<p>Jamás deberías sentir insatisfacción, pero ocurre que la naturaleza humana suele recrear el vicio ante las falsas necesidades existentes. Esto, como todo, está previsto, y desde los recursos divinos se extiende siempre una forma para que podamos saciar el vacío, lo escaso y hasta lo que sentimos es precario en cada uno de nosotros. Se trata de la facultad interna de extender una petición.</p>
<p>Podría considerarse fácil y hasta natural, pero la realidad es que no traduce nuestra Verdad sino desde el mismo momento en que lo clamado coincida con nuestro propósito y se apegue a la razón de la Luz que nos pertenece.</p>")

Lesson.create(name: "Recibir Respuesta", lesson_level: ll, number_level: 11, number: 11, description: "<p>Nuestro compromiso siempre está presente, aunque no siempre activo. Por eso, estar aquí es la forma real de concebirte como esa Fuerza de Luz.</p>
<p>Sólo tienes que aceptarte y empezar la cruzada interna para rendirte y así ganar el Juego Cósmico, ése que te ha dotado de todas las libertades humanas para que puedas emprender tu reto de Ser el más Divino.</p>
<p>Cualquiera que sea tu respuesta, ya estás en la constante virtual de la existencia, en la que hoy, una vez más, decides hacia dónde plegarte: la Luz o la oscuridad.</p>")

Lesson.create(name: "Mantener la Fe", lesson_level: ll, number_level: 12, number: 12, description: "<p>Así como haz pasado este año instruyéndote desde tu amor, imagina de lo que serías capaz, más cuando sabes que haz alcanzado a dar pasos hacia ti mismo tan importantes.</p>
<p>Revélate más, deja que todo siga tan bien como hasta ahora. Porque lo que debes saber es que cualquier cosa que haya ocurrido, todo cuanto has sentido y lo que has experimentado, forma parte de ti.</p>
<p>Ya has empezado a construir tus cimientos de Fe y lo has llevado hasta la Esperanza, condiciones de Amor Divinas. Felicítate.</p>")


ll = LessonLevel.create(name: "Vidya")

Lesson.create(name: "El consentimiento", lesson_level: ll, number_level: 1, number: 13, description: "<p>Nadie puede decirte nada para convencerte de algo, y menos si en ti no se ha dado todavía algún tipo de respuesta. Quien se propone busca, desde un principio, hacer el contacto trascendente y definitivo sin apelar a instancias y menos a alguien que lo instruya.</p>
<p>Cada Dios tiene su Maestro, y es el mismo Cosmos un asiento infinito de Seres Supremos prestos a brindar la respuesta cuando ya quieres escucharla para aceptarla y declararte en el conocimiento propio. Eso es parte del consentir que eres en el Dios</p>")

Lesson.create(name: "La Reacción", lesson_level: ll, number_level: 2, number: 14, description: "<p>Nuestras estructuras están dispuestas, tácitamente y aunque no lo sepamos, no lo aceptemos, ni lo evidenciemos, dentro de un orden perfecto. Por supuesto que, desde el Ideal Divino, se espera que la reacción ante esta Verdad se exprese ya.</p>
<p>Sin estar sujeta a tantas condicionantes humanas, dificultando cada día más que esta reacción activa produzca, en el tiempo ideal y en las maravillosas condiciones divinas, una favorable situación espiritual, y quede así establecido en este planeta el Principio Único: el Amor.</p>")

ls = Lesson.create(name: "La Recreación", lesson_level: ll, number_level: 3, number: 15, description: "<p>Lecciones destinadas al desarrollo espiritual de los miembros de la Escuela Valores Divinos. Material de enseñanza exclusiva para quienes han elegido mantenerse en resguardo y guía del linaje de Maestros que las imparten. No se recomienda su reproducción total o parcial.</p>
<p>¿Qué hemos creado desde nosotros mismos, sintiéndonos qué o quiénes dentro de la vasta ecuación creadora? ¿Cómo podemos reaccionar hoy ante la re-creación que hemos hecho? Sólo quienes han retomado la conciencia pueden percibir todo cuanto somos o, lo más temible, lo que no somos. Por lo que toma este tiempo para crear definitivamente lo que debes: tu Ser.</p>")

LessonLevel.create(name: "Shiva")


u.lesson = ls
u.save()