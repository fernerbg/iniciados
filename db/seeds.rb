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

Lesson.create(name: "La Búsqueda", lesson_level: ll, number_level: 1, number: 1, description: "<p>En entrega de lo que buscas.</p><p>Respondiendo siempre a lo que como necesidad expones.</p>
<p>Debes saber que donde menos lo creas está la Verdad y si se te dificulta llegar a ella, habla, pide, exige, pero no te quedes atrapado en la ignorancia, en el falso sueño, en la irrealidad.</p>
<p>Di, desde tu Ser más interno:</p>
<b><p>Estoy preparando en mí la mejor forma de entrega y también de recibir.</p>
<p>Estoy en la disposición de abrir en mí la puerta hacia mi interior.</p></b>")

Lesson.create(name: "El Encuentro", lesson_level: ll, number_level: 2, number: 2, description: "<p>Ante lo que buscas se te prepara, es como ir resolviendo lo que como enigma ves: el Ser que Eres.</p>
<p>Reconocerte, sentirte, estimularte desde ti, es la primera etapa de lo que crees es una búsqueda interminable.</p>
<p>Pero, tan sólo en el hecho de iniciarte para emprender esta aventura, ya estás en el camino exacto.</p>
<p>Dí con el entendimiento que te impulsa:</p>
<b><p>“Estoy expectante de mí.</p>
<p>Me he ido sintiendo en lo que Soy, sólo busco lo que hay y es lo que espero encontrar.</p>
<p>Nada más”.</p></b>")

Lesson.create(name: "La Enseñanza", lesson_level: ll, number_level: 3, number: 3, description: "<p>Lo que buscas es que te faciliten más de tus propias herramientas para aprender.</p>
<p>Pero… ¿cómo se obtiene eso?</p>
<p>Y es cuando te propones iniciarte, determinando muy dentro de ti la intención exacta de aprendizaje.</p>
<p>Lo otro sería:</p>
<p>¿Quién puede ser capaz de impartirme la Enseñanza?</p>
<p>Y allí siente tu bendición de dilucidar que existe alguien, a quien sabiamente has reconocido como el conducto preciso y preciado, que puede llevarte hasta la Verdad.</p>
<p>Es esto lo que puedes concebir como el primer paso que tu voluntad da para recibir lo que existe.</p>
<p>¿Es real lo que se da y se genera de la Enseñanza?</p>
<p>Absolutamente, más, si ya has aceptado que es -igualmente- el primer paso hacia tu propia realización.</p>")

Lesson.create(name: "El Aprendizaje", lesson_level: ll, number_level: 4, number: 4, description: "<p>Mis capacidades ahora se abren ante la magnitud de las Esferas que me asisten.</p>
<p>Porque entiendo que he llegado a un estadio en el que he resuelto mucho y se gesta en mí el ímpetu –para nada forzado- de seguir.</p>
<p>Desde todo lo que soy y sé en mí, me conecto para alcanzar el valor y las formas más exactas de revelarme todo cuanto he aprendido de mí y tomar lo puro y así seguir.</p>
<p>Sea lo que hoy contengo la base justa para todo cuanto hoy aprendo.</p>")

Lesson.create(name: "La Toma de Conciencia", lesson_level: ll, number_level: 5, number: 5, description: "<p>Sé que soy parte de un todo exacto y juego a la disgregación, cada vez de forma más consciente.</p>
<p>Todo lo que de mí no sea voy a disiparlo, aceptando el juego supremo de empezar a creer en lo que soy.</p>
<p>Desde la forma que represento, me veo hoy siendo más capaz de producir en mí, aspectos que me permitan combatir mi inconsciencia, dada en forma de ignorancia y desamor.</p>
<p>Me sujeto a la fuerza que sé soy, hoy y siempre.</p>")

ls = Lesson.create(name: "El Despendimiento", lesson_level: ll, number_level: 6, number: 6, description: "<p>Se trata de algo más que una verdad.</p>
<p>Y estaríamos sobre un supuesto que sólo podemos comprender cuando nos alineamos a la entrega, antes no.</p>
<p>Es ir descartando sensaciones, deseos, y la condición más firme y arraigada: Ser humano.</p>
<p>Esto, como dulce ofrenda hacia nosotros mismos frente a la contundente realidad de aceptarnos en la Nada, inequívoco concepto Divino que-tarde o temprano- descubrimos al experimentarnos profundamente.</p>
<p>Es la base de la entrega a tono de devolución en gratitud y en servicio.</p>
<p>Conducto imprescindible hacia la Eternidad.</p>")



ll = LessonLevel.create(name: "Vidia")

LessonLevel.create(name: "Shiva")


u.lesson = ls
u.save()