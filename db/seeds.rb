# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(email: 'iniciado@gmail.com', password: 'sbabaji7', name: 'Cesar', surname: 'Valderrama', aws_identity: 'us-west-2:a697799f-48ec-452a-9773-9fea04ab454f')

Configuration.create(name:"AWS_id", value:"AKIAIPOLUIWRXMEDLAKA")
Configuration.create(name:"AWS_secret", value:"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")

p = Profile.create(name: 'admin')
p.save()
u.profiles << p

p = Profile.create(name: 'student')
p.save()
u.profiles << p

p = Profile.create(name: 'coordinator')
p.save()
u.profiles << p


les = Level.create(name: "Fuego I", number: 1)
Level.create(name: "Fuego II", number: 2)
Level.create(name: "Luz I", number: 3)
Level.create(name: "Luz II", number: 4)
Level.create(name: "Cósmico I", number: 5)
Level.create(name: "Estelar I", number: 7)
Level.create(name: "Madre I", number: 9)

u.level = les
u.save()

ll = LessonLevel.create(name: "Atma")


Lesson.create(name: "La Búsqueda", lesson_level: ll, number_level: 1, number: 1, description: "<p>En entrega de lo que buscas.</p><p>Respondiendo siempre a lo que como necesidad expones.</p><p>Debes saber que donde menos lo creas está la Verdad</p><p>y si se te dificulta llegar a ella, habla, pide, exige,</p><p>pero no te quedes atrapado en la ignorancia,</p><p>en el falso sueño, en la irrealidad.</p>
<p>Di, desde tu Ser más interno:</p><p><b>Estoy preparando en mí la mejor forma</p><p>de entrega y también de recibir.</p><p>Estoy en la disposición de abrir en mí</p><p>la puerta hacia mi interior.</p>")

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

ls = Lesson.create(name: "Mantener la Fe", lesson_level: ll, number_level: 12, number: 12, description: "<p>Así como haz pasado este año instruyéndote desde tu amor, imagina de lo que serías capaz, más cuando sabes que haz alcanzado a dar pasos hacia ti mismo tan importantes.</p>
<p>Revélate más, deja que todo siga tan bien como hasta ahora. Porque lo que debes saber es que cualquier cosa que haya ocurrido, todo cuanto has sentido y lo que has experimentado, forma parte de ti.</p>
<p>Ya has empezado a construir tus cimientos de Fe y lo has llevado hasta la Esperanza, condiciones de Amor Divinas. Felicítate.</p>")


ll = LessonLevel.create(name: "Vidya")

Lesson.create(name: "El consentimiento", lesson_level: ll, number_level: 1, number: 13, description: "<p>Nadie puede decirte nada para convencerte de algo, y menos si en ti no se ha dado todavía algún tipo de respuesta. Quien se propone busca, desde un principio, hacer el contacto trascendente y definitivo sin apelar a instancias y menos a alguien que lo instruya.</p>
<p>Cada Dios tiene su Maestro, y es el mismo Cosmos un asiento infinito de Seres Supremos prestos a brindar la respuesta cuando ya quieres escucharla para aceptarla y declararte en el conocimiento propio. Eso es parte del consentir que eres en el Dios</p>")

Lesson.create(name: "La Reacción", lesson_level: ll, number_level: 2, number: 14, description: "<p>Nuestras estructuras están dispuestas, tácitamente y aunque no lo sepamos, no lo aceptemos, ni lo evidenciemos, dentro de un orden perfecto. Por supuesto que, desde el Ideal Divino, se espera que la reacción ante esta Verdad se exprese ya.</p>
<p>Sin estar sujeta a tantas condicionantes humanas, dificultando cada día más que esta reacción activa produzca, en el tiempo ideal y en las maravillosas condiciones divinas, una favorable situación espiritual, y quede así establecido en este planeta el Principio Único: el Amor.</p>")

Lesson.create(name: "La Recreación", lesson_level: ll, number_level: 3, number: 15, description: "<p>Lecciones destinadas al desarrollo espiritual de los miembros de la Escuela Valores Divinos. Material de enseñanza exclusiva para quienes han elegido mantenerse en resguardo y guía del linaje de Maestros que las imparten. No se recomienda su reproducción total o parcial.</p>
<p>¿Qué hemos creado desde nosotros mismos, sintiéndonos qué o quiénes dentro de la vasta ecuación creadora? ¿Cómo podemos reaccionar hoy ante la re-creación que hemos hecho? Sólo quienes han retomado la conciencia pueden percibir todo cuanto somos o, lo más temible, lo que no somos. Por lo que toma este tiempo para crear definitivamente lo que debes: tu Ser.</p>")

Lesson.create(name: "La Fortaleza", lesson_level: ll, number_level: 4, number: 16, description: "<p>Es intensa la dinámica que se descubre cuando, por aquello de despertar, coincidir con el propósito y establecer la Fe, nos encontramos. Es en esa realidad, en la que habitamos desde algún aspecto, que no tardamos en descifrar y sostener dentro de nosotros, pero con el único fin de disuadirlo, un aspecto negador.</p>
<p>Para que nos permita entrar a nuestro Ser interior, para luego estar y permanecer en la invisible y sublime estancia que nos reserva. Sólo así, bajo la esperanza consciente del Ser, podemos alcanzar la fortaleza en Luz para seguir. </p>")

Lesson.create(name: "El Autonocimiento", lesson_level: ll, number_level: 5, number: 17, description: "<p>El poder de lo Creado es inmenso, tanto como el Creador mismo. Él se ha inspirado de tal manera, que todo cuanto lo conforma cuenta con sus cualidades. Entre las más propagadas, aunque menos logradas, está la perfección.</p>
<p>En esta aventura de autoservirnos, de andar ya sobre procesos de conocimiento, autoconocimiento y reconocimiento, ronda su más hermosa energía, ubicándose en nuestra Alma, cada vez menos peregrina, para llevarla a la propuesta más exacta: servirle en Luz.</p>")

Lesson.create(name: "La Revelación", lesson_level: ll, number_level: 6, number: 18, description: "<p>Estamos más que dispuestos en este Universo para llevar a cabo un Plan que ha sido objeto de todo tipo de atentados y divagaciones, con el único objeto de que no se cumpla. Muchos pueden creer que la programación previa no podía haber sido distorsionada y muchos menos trastocada.</p>
<p>Lo fue y sigue siéndolo, por lo que es imperioso que ajustemos, de una vez, nuestras conciencias activas, y disipemos registros negadores, que sólo atentan contra la exquisita bendición de ser parte de la Luz del mismo Creador.</p>")

Lesson.create(name: "Controlar la Mente", lesson_level: ll, number_level: 7, number: 19, description: "<p>En este no saber nos encontramos con que, en alguna parte de nosotros, habita la clave más firme para descubrirnos. Puede que en cada uno exista una clave diferente, pero lo que no debería estar en duda ni tampoco negarse, es que venimos de la Conciencia de Luz más hermosa que existe.</p>
<p>Esta clave se ha sostenido desde hace mucho en nuestra mente y es ahora el momento para obtenerla, y dejar que ya no sea sólo la razón la que gobierne la Naturaleza Divina del Ser, la que espera ser activada...</p>")

Lesson.create(name: "Liberar el Karma", lesson_level: ll, number_level: 8, number: 20, description: "<p>\"Agoto lo que soy y no soy y así llego a la constante infinita\".</p>
<p>Así debería rezar la idea que nos libere, la que nos permita disgregar de nuestra mente la irrealidad a la que nos sometemos cada vez que intentamos Ser. Es necesario que nos propongamos alcanzar, de una buena vez, la estancia superior de nuestro objetivo, al haber sido creados por y para un fin único: Ser.</p>
<p>Lo que malamente asumimos como Karma no es más que una tarea, sujeta a nuestro propio propósito y tras nuestro propio mandato...</p>")

Lesson.create(name: "Liberar el Karma", lesson_level: ll, number_level: 9, number: 21, description: "<p>\"Agoto lo que soy y no soy y así llego a la constante infinita\".</p>
<p>Así debería rezar la idea que nos libere, la que nos permita disgregar de nuestra mente la irrealidad a la que nos sometemos cada vez que intentamos Ser. Es necesario que nos propongamos alcanzar, de una buena vez, la estancia superior de nuestro objetivo, al haber sido creados por y para un fin único: Ser.</p>
<p>Lo que malamente asumimos como Karma no es más que una tarea, sujeta a nuestro propio propósito y tras nuestro propio mandato...</p>")

Lesson.create(name: "Liberar el Karma", lesson_level: ll, number_level: 10, number: 22, description: "<p>\"Agoto lo que soy y no soy y así llego a la constante infinita\".</p>
<p>Así debería rezar la idea que nos libere, la que nos permita disgregar de nuestra mente la irrealidad a la que nos sometemos cada vez que intentamos Ser. Es necesario que nos propongamos alcanzar, de una buena vez, la estancia superior de nuestro objetivo, al haber sido creados por y para un fin único: Ser.</p>
<p>Lo que malamente asumimos como Karma no es más que una tarea, sujeta a nuestro propio propósito y tras nuestro propio mandato...</p>")

Lesson.create(name: "Alcanzar la Paz", lesson_level: ll, number_level: 11, number: 23, description: "<p>Muchos pensarán que la Paz se solicita. Y no es así, hay que construirla. Nadie puede alcanzarla en tanto no la trabaje. ¿Cómo? Y el asunto podría ser complejo si nos limitamos a entenderla como una acción, más que como una consecuencia.</p>
<p>Siendo en realidad la acción y la consecuencia, el intento y el resultado, la inversión y la ganancia. La Paz es lo que obtenemos tras librar nuestras más duras batallas internas.</p>")

Lesson.create(name: "Mantener la Realidad del Ser", lesson_level: ll, number_level: 12, number: 24, description: "<p>Ya una vez dispuestos, la idea es proseguir, tratando de sostener en nosotros la forma más coherente de realidad que hayamos encontrado. Unirla así, como si de una receta se tratara, con lo que hemos alcanzado como principio de Fe, y disolver en esta mezcla todos nuestros temores.</p>
<p>Una vez alcanzado esto como logro, en nuestra calidad de Adeptos, lo que queda es perseverar como almas adscritas aún a este plano, y dispuestas a ascender desde aquí hasta las vibraciones de Amor que se disponen.</p>")



ll = LessonLevel.create(name: "Shiva")

Lesson.create(name: "Vivir en el Ser", lesson_level: ll, number_level: 1, number: 25, description: "<p>La experiencia de vida, cualquiera que sea, debe ser tomada como una bondad. Son pocas las personas que se sostienen en este entendimiento, prefiriendo permanecer sujetas a los vaivenes que marcan los hechos, sin advertir que siempre serán producto de nuestras propias acciones.</p>
<p>Seguir manejándonos como un colectivo de fuerzas desintegradas, no nos ha dado ningún resultado loable, más que dispersar la real fuerza de evolución y unión que nos mantendría en una situación distinta, y siempre pensamos que mejor.</p>")

Lesson.create(name: "Confiar en el Plan", lesson_level: ll, number_level: 2, number: 26, description: "<p>¿Sacarías la cabeza en un avión en movimiento? ¿Lo harías? Más o menos eso es lo que tienes que hacer ahora, en este momento, en este tiempo.</p>
<p>¿Existen tantas formas de integrarte definitivamente al Plan, que tal vez buscarías una menos arriesgada, y estarías en tu razón. Eso sí, si desde alguna parte de ti no sientes la alerta constante, el llamado continuo, la necesidad de una respuesta inmediata. Por eso tienes que graduarte, realizar una medición interior que te dé razones propias para adaptarte a tu Verdad.</p>")

Lesson.create(name: "Madre: su Sutil Manifiesto", lesson_level: ll, number_level: 3, number: 27, description: "<p>Las comprensiones del Dios pueden contener el registro de lo que nuestra conciencia alberga ya como Verdad.</p>
<p>Estamos sujetos a lo que realmente existe dentro de nosotros, lo que no significa que sea lo que Es. Vamos alcanzando luces en la medida que avanzamos en nuestro camino evolutivo, que no es más que una constante cósmica predeterminada por nuestro Ser en conjunción con la Conciencia Superior.</p>")

Lesson.create(name: "Padre: El Gran Ejecutor", lesson_level: ll, number_level: 4, number: 28, description: "<p>\Las firmezas con las que hoy cuentas en tu vida son aquellas expresiones del Ser que has alcanzado en ti. Son, básicamente, tus logros, tus recursos y, finalmente, tu herencia.</p>
<p>¿Has pensado de quién has heredado todo? ¿Cuántas causales te han llegado para recibir un legado que consideras propio?</p>
<p>Y no son muchos los que le confieren al Padre esa distinción: Ser el Todo. Ser el Creador y el productor de TODO. Ser quien acciona y quien recibe.</p>")

Lesson.create(name: "Sin Pasado ni Futuro", lesson_level: ll, number_level: 5, number: 29, description: "<p>Recordemos sin vicios que acomplejan y reducen, espectemos sin malograr las fuerzas que podrían rendirse, establezcamos lo que somos hoy muy profundamente, sin alterar nada, acogiendo la verdad propia sin temor. Es el tiempo de crear más fórmulas internas que nos hagan trascender más allá de lo que hoy mismo somos.</p>
<p>Nuestra percepción del tiempo se hace muy limitada en este plano y no tendría que ser así. Claro que hemos recurrido a sostener en nosotros tan sólo una milésima de nuestro ejercicio consciente de vida para poder avanzar.</p>")

Lesson.create(name: "Presente Siempre Presente", lesson_level: ll, number_level: 6, number: 30, description: "<p> La posibilidad real es enfatizar nuestra propuesta a partir del presente que nos cobija, como esta forma de habitar una y otra vez la existencia.</p>
<p>Debemos de relacionarnos, sin temor, con la temporalidad que existe como resolución de Luz dentro del Cosmos y sujetar nuestra materia tan sólo a las experiencias de Luz concretas que nos han permitido la evolución y la conexión con el Propósito.</p>")

u.lesson = ls
u.save()