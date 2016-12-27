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

ll = LessonLevel.create(name: "Atma", number: 1)


Lesson.create(name: "La Búsqueda", lesson_level: ll, number_level: 1, number: 1, description: "
<p>En entrega de lo que buscas.</p>
<p>Respondiendo siempre a lo que como necesidad expones.</p>
<p>Debes saber que donde menos lo creas está la Verdad</p>
<p>y si se te dificulta llegar a ella, habla, pide, exige,</p>
<p>pero no te quedes atrapado en la ignorancia,</p>
<p>en el falso sueño, en la irrealidad.</p>
<p>Di, desde tu Ser más interno:</p>
<b><p>Estoy preparando en mí la mejor forma</p>
<p>de entrega y también de recibir.</p>
<p>Estoy en la disposición de abrir en mí</p>
<p>la puerta hacia mi interior.</p></b>")

Lesson.create(name: "El Encuentro", lesson_level: ll, number_level: 2, number: 2, description: "
<p>Ante lo que buscas se te prepara,</p>
<p>es como ir resolviendo lo que como enigma ves:</p>
<p>el Ser que Eres.</p>
<p>Reconocerte, sentirte, estimularte desde ti,</p>
<p>es la primera etapa de lo que crees es una búsqueda interminable.</p>
<p>Pero, tan sólo en el hecho de iniciarte para emprender esta aventura,</p>
<p>ya estás en el camino exacto.</p>
<p>Dí con el entendimiento que te impulsa:</p>
<b><p>\"Estoy expectante de mí.</p>
<p>Me he ido sintiendo en lo que Soy,</p>
<p>sólo busco lo que hay y es lo que espero encontrar.</p>
<p>Nada más'</p></b>")

Lesson.create(name: "La Enseñanza", lesson_level: ll, number_level: 3, number: 3, description: "
<p>Lo que buscas es que te faciliten más</p>
<p>de tus propias herramientas para aprender.</p>
<p>Pero... ¿cómo se obtiene eso?</p>
<p>Y es cuando te propones iniciarte,</p>
<p>determinando muy dentro de ti la intención exacta de aprendizaje.</p>
<p>Lo otro sería:</p>
<p>¿Quién puede ser capaz de impartirme la Enseñanza?</p>
<p>Y allí siente tu bendición de dilucidar que existe alguien,</p>
<p>a quien sabiamente has reconocido como el conducto preciso y preciado,</p>
<p>que puede llevarte hasta la Verdad</p>
<p>Es esto lo que puedes concebir como el primer paso</p>
<p>que tu voluntad da para recibir lo que existe.</p>
<p> ¿Es real lo que se da y se genera de la Enseñanza?</p>
<p>Absolutamente</p>
<p>más, si ya has aceptado que es</p>
<p>-igualmente- el primer paso hacia tu propia realización.</p>")

Lesson.create(name: "El Aprendizaje", lesson_level: ll, number_level: 4, number: 4, description: "
<p>Mis capacidades ahora se abren ante la magnitud</p>
<p>de las Esferas que me asisten.</p>
<p>Porque entiendo que he llegado a un estadio</p>
<p>en el que he resuelto mucho y se gesta en mí el ímpetu</p>
<p>-para nada forzado- de seguir.</p>
<p>Desde todo lo que soy y sé en mí,</p>
<p>me conecto para alcanzar el valor</p>
<p>y las formas más exactas de revelarme</p>
<p>todo cuanto he aprendido de mí</p>
<p>y tomar lo puro y así seguir.</p>
<p>Sea lo que hoy contengo la base justa</p>
<p>para todo cuanto hoy aprendo.</p>")

Lesson.create(name: "La Toma de Conciencia", lesson_level: ll, number_level: 5, number: 5, description: "
<p>Sé que soy parte de un todo exacto y juego a la disgregación,</p>
<p>cada vez de forma más consiente.</p>
<p>Todo lo que de mi no sea voy a disiparlo,</p>
<p>aceptando el juego supremo de empezar a creer en lo que soy.</p>
<p>Desde la forma que represento,</p>
<p>me veo hoy siendo más capaz de producir en mí,</p>
<p>aspectos que me permitan combatir mi inconsciencia,</p>
<p>dada en forma de ignorancia y desamor.</p>
<p>Me sujeto a la fuerza que sé soy,</p>
<p>hoy y siempre.</p>")

Lesson.create(name: "El Desprendimiento", lesson_level: ll, number_level: 6, number: 6, description: "
<p>Se trata mas que de una verdad.</p>
<p>Y estaríamos sobre un supuesto que solo podemos comprender</p>
<p>cuando nos alineamos a la entrega, antes no.</p>
<p>Es ir descartando sensaciones, deseos,</p>
<p>y la condición mas firme y arraigada:</p>
<p>Ser humano.</p>
<p>Esto, como dulce ofrenda hacia nosotros mismos</p>
<p>frente a la contundente realidad de aceptarnos en la Nada,</p>
<p>inequívoco concepto Divino</p>
<p>que-tarde o temprano- descubrimos</p>
<p>al experimentarnos profundamente.</p>
<p>Es la base de la entrega a tono de devolución en gratitud y en servicio.</p>
<p>Conducto imprescindible hacia la Eternidad.</p>")


Lesson.create(name: "La Conexión", lesson_level: ll, number_level: 7 , number: 7, description: "
<p>El sentimiento de abandono se da en instantes de desolación,</p>
<p>de angustia, de inconformidad o de negatividad.</p>
<p>Pero basta recrearnos,</p>
<p>en un instante también,</p>
<p>en alguna premisa que nos permita sentir al Creador,</p>
<p>y allí se restablece todo.</p>
<p>Si tan sólo nos permitiéramos contener</p>
<p>-en estos tiempos- más Fe en lo que somos</p>
<p>y nos atreviéramos a parar el flujo negador de la existencia</p>
<p>que se asoma a cada paso y en cada resquicio de este mundo visible.</p>
<p>Si desde nuestra capacidad nos estimuláramos a concederle a</p>
<p>la Fuerza Divina el verdadero poder de habitarnos,</p>
<p>no estaríamos en esta mala interpretación de la Verdad y</p>
<p>todos estaríamos inmersos en el flujo infinito del Ser.</p>")

Lesson.create(name: "El Propósito", lesson_level: ll, number_level: 8, number: 8, description: "
<p>Constante, constante, constante.</p>
<p>Se trata de una progresión infinita de Creación.</p>
<p>Lo que no tiene principio ni fin,</p>
pero se extiende como el poder de la Luz y el Amor</p>
<p>en una Ley Absoluta.</p>
<p>Si eso es lo que nos creó, nos expandió y lo que nos guía,</p>
<p>¿cómo es que hemos podido generaren nosotros el intimo</p>
<p>y ultimo respiro de integrarnos?</p>
<p>El concepto de la Unidad es la propuesta de fusión</p>
<p>y de comprensión existencial para alcanzar</p>
<p>lo que se plantea como salvación-en un menor entendimiento-</p>
<p>y reconocimiento en una formulación mas elevada.</p>
<p>Seamos capaces de reafirmarnos al Uno como lo que existe</p>
<p>en nuestro principio interno y alcancemos la Verdad.</p>")

Lesson.create(name: "Avanzar Hacia la Verdad", lesson_level: ll, number_level: 9, number: 9, description: "
<p>Cada vez las opciones de Ser se sublimizan más,</p>
<p>es parte de este juego evolutivo.</p>
<p>Es como si quisieras</p>
<p>-ni mas ni menos- perfeccionarte. Es así.</p>
<p>Ascender, trascender, liberarte</p>
<p>palabras que vas a empezar a entender</p>
<p>y a asumir para sumarlas a tu existencia.</p>
<p>Sabes que has pronunciado ya una proclama</p>
<p>extensa, que por momentos puede sobrepasar</p>
<p>tus fuerzas y hasta tu misma voluntad.</p>
<p>Pero si algo debes considerar,</p>
<p>es que te estas entregando con base en una asistencia</p>
<p>pedida y enviada desde el UNO.</p>")

Lesson.create(name: "Realizar una Petición", lesson_level: ll, number_level: 10, number: 10, description: "
<p>Jamás deberías sentir insatisfacción,</p>
<p>pero ocurre que la naturaleza humana suele recrear el vicio</p>
<p>ante las falsas necesidades existentes.</p>
<p>Esto, como todo, está previsto,</p>
<p>y desde los recursos divinos se extiende siempre una forma</p>
<p>para que podamos saciar el vacío,</p>
<p>lo escaso y hasta lo que sentimos</p>
<p>es precario en cada uno de nosotros.</p>
<p>Se trata de la facultad interna de extender una petición.</p>
<p>Podría considerarse fácil y hasta natural,</p>
<p>pero la realidad es que no traduce nuestra Verdad</p>
<p>sino desde el mismo momento en que lo clamado</p>
<p>coincida con nuestro propósito</p>
<p>y se apegue a la razón de la Luz que nos pertenece.</p>")

Lesson.create(name: "Recibir Respuesta", lesson_level: ll, number_level: 11, number: 11, description: "
<p>Nuestro compromiso siempre está presente,</p>
<p>aunque no siempre activo.</p>
<p>Por eso, estar aquí es la forma real de concebirte</p>
<p>como esa Fuerza de Luz.</p>
<p>Sólo tienes que aceptarte y empezar la cruzada interna</p>
<p>para rendirte y así ganar el Juego Cósmico,</p>
<p>ése que te ha dotado de todas las libertades humanas</p>
<p>para que puedas emprender tu reto de Ser el más Divino.</p>
<p>Cualquiera que sea tu respuesta,</p>
<p>ya estás en la constante virtual de la existencia,</p>
<p>en la que hoy, una vez más, decides hacia dónde plegarte:</p>
<p>la Luz o la oscuridad.</p>")

Lesson.create(name: "Mantener la Fe", lesson_level: ll, number_level: 12, number: 12, description: "
<p>Así como haz pasado este año instruyéndote desde tu amor,</p>
<p>imagina de lo que serías capaz,</p>
<p>más cuando sabes que haz alcanzado a dar pasos</p>
<p>hacia ti mismo tan importantes.</p>
<p>Revélate más,</p>
<p>deja que todo siga tan bien como hasta ahora.</p>
<p>Porque lo que debes saber es que cualquier cosa que haya ocurrido,</p>
<p>todo cuanto has sentido y lo que has experimentado, forma parte de ti.</p>
<p>Ya has empezado a construir tus cimientos de Fe</p>
<p>y lo has llevado hasta la Esperanza,</p>
<p>condiciones de Amor Divinas.</p>
<p>Felicítate.</p>")


ll = LessonLevel.create(name: "Vidya", number: 2)

Lesson.create(name: "El consentimiento", lesson_level: ll, number_level: 1, number: 13, description: "
<p>Nadie puede decirte nada para convencerte de algo,</p>
<p>y menos si en ti no se ha dado todavía algún tipo de respuesta.</p>
<p>Quien se propone busca, desde un principio,</p>
<p>hacer el contacto trascendente y definitivo</p>
<p>sin apelar a instancias</p>
<p>y menos a alguien que lo instruya.</p>
<p></p>
<p>Cada Dios tiene su Maestro, y es el mismo Cosmos un asiento</p>
<p>infinito de Seres Supremos prestos a brindar la respuesta</p>
<p>cuando ya quieres escucharla para aceptarla,</p>
y declararte en el conocimiento propio.</p>
<p>Eso es parte del consentir que eres en el Dios</p>")

Lesson.create(name: "La Reacción", lesson_level: ll, number_level: 2, number: 14, description: "
<p>Nuestras estructuras están dispuestas, tácitamente</p>
<p>y aunque no lo sepamos,</p>
<p>no lo aceptemos, ni lo evidenciemos,</p>
<p>dentro de un orden perfecto.</p>
<p>Por supuesto que, desde el Ideal Divino,</p>
<p>se espera que la reacción ante esta Verdad se exprese ya.</p>
<p>Sin estar sujeta a tantas condicionantes humanas,</p>
<p>dificultando cada día más que esta reacción activa produzca,</p>
<p>en el tiempo ideal y en las maravillosas condiciones divinas,</p>
<p>una favorable situación espiritual,</p>
<p>y quede así establecido en este planeta el Principio Único:</p>
<p>el Amor.</p>")

Lesson.create(name: "La Recreación", lesson_level: ll, number_level: 3, number: 15, description: "
<p>¿Qué hemos creado desde nosotros mismos,</p>
<p>sintiéndonos qué o quiénes dentro de la vasta ecuación creadora?</p>
<p>¿Cómo podemos reaccionar hoy ante la re-creación que hemos hecho?</p>
<p>Sólo quienes han retomado la conciencia</p>
<p>pueden percibir todo cuanto somos o,</p>
<p>lo más temible, lo que no somos.</p>
<p>Por lo que toma este tiempo</p>
<p>para crear definitivamente lo que debes: tu Ser.</p>")

Lesson.create(name: "La Fortaleza", lesson_level: ll, number_level: 4, number: 16, description: "
<p>Es intensa la dinámica que se descubre cuando,</p>
<p>por aquello de despertar,</p>
<p>coincidir con el propósito y establecer la Fe,</p>
<p>nos encontramos.</p>
<p>Es en esa realidad,</p>
<p>en la que habitamos desde algún aspecto,</p>
<p>que no tardamos en descifrar y sostener dentro de nosotros,</p>
<p>pero con el único fin de disuadirlo, un aspecto negador.</p>
<p>Para que nos permita entrar a nuestro Ser interior,</p>
<p>para luego estar y permanecer</p>
<p>en la invisible y sublime estancia que nos reserva.</p>
<p>Sólo así, bajo la esperanza consciente del Ser,</p>
<p>podemos alcanzar la fortaleza en Luz para seguir.</p>")

Lesson.create(name: "El Autoconocimiento", lesson_level: ll, number_level: 5, number: 17, description: "<p>
El poder de lo Creado es inmenso, tanto como el Creador mismo.</p>
<p>Él se ha inspirado de tal manera,</p>
<p>que todo cuanto lo conforma cuenta con sus cualidades.</p>
<p>Entre las más propagadas, aunque menos logradas,</p>
<p>está la perfección.</p>
<p>En esta aventura de autoservirnos,</p>
<p>de andar ya sobre procesos de conocimiento,</p>
<p>autoconocimiento y reconocimiento,</p>
<p>ronda su más hermosa energía,</p>
<p>ubicándose en nuestra Alma, cada vez menos peregrina,</p>
<p>para llevarla a la propuesta más exacta: servirle en Luz.</p>")

Lesson.create(name: "La Revelación", lesson_level: ll, number_level: 6, number: 18, description: "
<p>Estamos más que dispuestos en este Universo para llevar a cabo</p>
<p>un Plan que ha sido objeto de todo tipo de atentados y divagaciones,</p>
<p>con el único objeto de que no se cumpla.</p>
<p>Muchos pueden creer que la programación previa</p>
<p>no podía haber sido distorsionada y muchos menos trastocada.</p>
<p>Lo fue y sigue siéndolo, por lo que es imperioso que ajustemos,</p>
<p>de una vez, nuestras conciencias activas,</p>
<p>y disipemos registros negadores,</p>
<p>que sólo atentan contra la exquisita bendición</p>
<p>de ser parte de la Luz del mismo Creador.</p>")

Lesson.create(name: "Controlar la Mente", lesson_level: ll, number_level: 7, number: 19, description: "
<p>En este no saber nos encontramos con que,</p>
<p>en alguna parte de nosotros,</p>
<p>habita la clave más firme para descubrirnos.</p>
<p>Puede que en cada uno exista una clave diferente,</p>
<p>pero lo que no debería estar en duda ni tampoco negarse,</p>
<p>es que venimos de la Conciencia de Luz más hermosa que existe.</p>
<p>Esta clave se ha sostenido desde hace mucho en nuestra mente</p>
<p>y es ahora el momento para obtenerla,</p>
<p>y dejar que ya no sea sólo la razón la que gobierne</p>
<p>la Naturaleza Divina del Ser, la que espera ser activada</p>
<p>Y lo que puede ser aún más hermoso,</p>
<p>es que estamos siendo capaces de aceptar y reconocer</p>
<p>a quien como nosotros ya ha encumbrado y ascendido</p>
<p>a la proyección del Padre Creador</p>")

Lesson.create(name: "Liberar el Karma", lesson_level: ll, number_level: 8, number: 20, description: "
<b><p>\"Agoto lo que soy y no soy y así llego a la constante infinita\".</p></b>
<p>Así debería rezar la idea que nos libere,</p>
<p>la que nos permita disgregar de nuestra mente</p>
<p>la irrealidad a la que nos sometemos</p>
<p>cada vez que intentamos Ser.</p>
<p>Es necesario que nos propongamos alcanzar, de una buena vez,</p>
<p>la estancia superior de nuestro objetivo,</p>
<p>al haber sido creados por y para un fin único: Ser.</p>
<p>Lo que malamente asumimos como Karma no es más que una tarea,</p>
<p>sujeta a nuestro propio propósito y tras nuestro propio mandato.</p>
<p>Una resultante siempre de nuestras acciones pasadas</p>
<p>que recuperamos para avanzar,</p>
<p>si eso es lo que finalmente queremos</p>")

Lesson.create(name: "Liberar el Karma", lesson_level: ll, number_level: 9, number: 21, description: "<p>\"Agoto lo que soy y no soy y así llego a la constante infinita\".</p>
<p>Así debería rezar la idea que nos libere, la que nos permita disgregar de nuestra mente la irrealidad a la que nos sometemos cada vez que intentamos Ser. Es necesario que nos propongamos alcanzar, de una buena vez, la estancia superior de nuestro objetivo, al haber sido creados por y para un fin único: Ser.</p>
<p>Lo que malamente asumimos como Karma no es más que una tarea, sujeta a nuestro propio propósito y tras nuestro propio mandato...</p>")

Lesson.create(name: "Liberar el Karma", lesson_level: ll, number_level: 10, number: 22, description: "<p>\"Agoto lo que soy y no soy y así llego a la constante infinita\".</p>
<p>Así debería rezar la idea que nos libere, la que nos permita disgregar de nuestra mente la irrealidad a la que nos sometemos cada vez que intentamos Ser. Es necesario que nos propongamos alcanzar, de una buena vez, la estancia superior de nuestro objetivo, al haber sido creados por y para un fin único: Ser.</p>
<p>Lo que malamente asumimos como Karma no es más que una tarea, sujeta a nuestro propio propósito y tras nuestro propio mandato...</p>")

Lesson.create(name: "Alcanzar la Paz", lesson_level: ll, number_level: 11, number: 23, description: "
<p>Muchos pensarán que la Paz se solicita.</p>
<p>Y no es así, hay que construirla.</p>
<p>Nadie puede alcanzarla en tanto no la trabaje.</p>
<p>¿Cómo? Y el asunto podría ser complejo</p>
<p>si nos limitamos a entenderla como una acción,</p>
<p>más que como una consecuencia.</p>
<p>Siendo en realidad la acción y la consecuencia,</p>
<p>el intento y el resultado, la inversión y la ganancia.</p>
<p>La Paz es lo que obtenemos</p>
<p>tras librar nuestras más duras batallas internas.</p>")

Lesson.create(name: "Mantener la Realidad del Ser", lesson_level: ll, number_level: 12, number: 24, description: "
<p>Ya una vez dispuestos,</p>
<p>la idea es proseguir, tratando de sostener en nosotros</p>
<p>la forma más coherente de realidad que hayamos encontrado.</p>
<p>Unirla así, como si de una receta se tratara,</p>
<p>con lo que hemos alcanzado como principio de Fe,</p>
<p>y disolver en esta mezcla todos nuestros temores.</p>
<p>Una vez alcanzado esto como logro,</p>
<p>en nuestra calidad de Adeptos,</p>
<p>lo que queda es perseverar como almas adscritas aún a este plano,</p>
<p>y dispuestas a ascender desde aquí</p>
<p>hasta las vibraciones de Amor que se disponen.</p>")


ll = LessonLevel.create(name: "Shiva", number: 3)

Lesson.create(name: "Vivir en el Ser", lesson_level: ll, number_level: 1, number: 25, description: "
<p>La experiencia de vida, cualquiera que sea,</p>
<p>debe ser tomada como una bondad.</p>
<p>Son pocas las personas que se sostienen en este entendimiento,</p>
<p>prefiriendo permanecer sujetas a los vaivenes que marcan los hechos,</p>
<p>sin advertir que siempre serán producto de nuestras propias acciones.</p>
<p>Seguir manejándonos como un colectivo de fuerzas desintegradas,</p>
<p>no nos ha dado ningún resultado loable,</p>
<p>más que dispersar la real fuerza de evolución y unión</p>
<p>que nos mantendría en una situación distinta, y siempre pensamos que mejor.</p>")

Lesson.create(name: "Confiar en el Plan", lesson_level: ll, number_level: 2, number: 26, description: "
<p>¿Sacarías la cabeza en un avión en movimiento? ¿Lo harías?</p>
<p>Más o menos eso es lo que tienes que hacer ahora,</p>
<p>en este momento, en este tiempo.</p>
<p>Existen tantas formas de integrarte definitivamente al Plan,</p>
<p>que tal vez buscarías una menos arriesgada,</p>
<p>y estarías en tu razón.</p>
<p>Eso sí, si desde alguna parte de ti no sientes la alerta constante,</p>
<p>el llamado continuo, la necesidad de una respuesta inmediata.</p>
<p>Por eso tienes que graduarte, realizar una medición interior que</p>
<p>te dé razones propias para adaptarte a tu Verdad.</p>")

Lesson.create(name: "Madre: su Sutil Manifiesto", lesson_level: ll, number_level: 3, number: 27, description: "
<p>Las comprensiones del Dios pueden contener el registro de</p>
<p>lo que nuestra conciencia alberga ya como Verdad.</p>
<p>Estamos sujetos a lo que realmente existe dentro de nosotros,</p>
<p>lo que no significa que sea lo que Es.</p>
<p>Vamos alcanzando luces en la medida que avanzamos</p>
<p>en nuestro camino evolutivo,</p>
<p>que no es más que una constante cósmica predeterminada</p>
<p>por nuestro Ser en conjunción con la Conciencia Superior.</p>")

Lesson.create(name: "Padre: El Gran Ejecutor", lesson_level: ll, number_level: 4, number: 28, description: "
<p>Las firmezas con las que hoy cuentas en tu vida</p>
<p>son aquellas expresiones del Ser que has alcanzado en ti.</p>
<p>Son, básicamente, tus logros, tus recursos y, finalmente, tu herencia.</p>
<p>¿Has pensado de quién has heredado todo?</p>
<p>¿Cuántas causales te han llegado para recibir un legado que consideras propio?</p>
<p>Y no son muchos los que le confieren al Padre esa distinción:</p>
<p>Ser el Todo. Ser el Creador y el productor de TODO.</p>
<p>Ser quien acciona y quien recibe.</p>")

Lesson.create(name: "Sin Pasado ni Futuro", lesson_level: ll, number_level: 5, number: 29, description: "
<p>Recordemos sin vicios que acomplejan y reducen,</p>
<p>espectemos sin malograr las fuerzas que podrían rendirse,</p>
<p>establezcamos lo que somos hoy muy profundamente, sin alterar nada,</p>
<p>acogiendo la verdad propia sin temor.</p>
<p>Es el tiempo de crear más fórmulas internas que nos hagan</p>
<p>trascender más allá de lo que hoy mismo somos.</p>
<p>Nuestra percepción del tiempo se hace muy limitada en este plano</p>
<p>y no tendría que ser así.
<p>Claro que hemos recurrido a sostener en nosotros</p>
<p>tan sólo una milésima de nuestro ejercicio</p>
<p>consciente de vida para poder avanzar.</p>")

ls = Lesson.create(name: "Presente Siempre Presente", lesson_level: ll, number_level: 6, number: 30, description: "
<p> La posibilidad real es enfatizar nuestra propuesta</p>
<p>a partir del presente que nos cobija,</p>
<p>como esta forma de habitar una y otra vez la existencia.</p>
<p>Debemos de relacionarnos, sin temor, con la temporalidad</p>
<p>que existe como resolución de Luz dentro del Cosmos</p>
<p>y sujetar nuestra materia tan sólo a las experiencias de Luz concretas</p>
<p>que nos han permitido la evolución y la conexión con el Propósito.</p>")

u.lesson = ls
u.save()