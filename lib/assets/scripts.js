
function clearBackgroundUrlImage(urlToClean)
{
    return urlToClean.replace(/^url\(['"]?/, '').replace(/['"]?\)$/, '');
}

function maximizar_imagen_fondo(obj)
{
    var obj = $(obj);

    var alto = obj.height();
    var ancho = obj.width();

    if (obj[0].tagName.toLowerCase() == 'body')
    {
        ancho = Math.max(document.documentElement.clientWidth, window.innerWidth || 0)
        alto = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)
        //alto = $(window).height();
        //ancho = $(window).width();
    }

    var proporcion_destino = ancho / alto;

    //alert(ancho + " , " + alto);
    var im = new Image();
    im.onload = function ()
    {
        var proporcion_imagen = this.width / this.height;

        obj.css('background-repeat', "no-repeat");
        obj.css('background-position', "center center");
        obj.css('background-attachment', "scroll");

        //alert(proporcion_imagen); alert(proporcion_destino);
        if (proporcion_destino > proporcion_imagen)
        {
            obj.css('background-size', ancho + "px auto");
        }
        else
        {
            obj.css('background-size', "auto " + alto + "px");
        }
    };

    im.src = clearBackgroundUrlImage(obj.css('background-image'));
}

function auto_ajustar_fondos_automaticos()
{
    $('.auto_ajustar_fondo').each(function (index, element)
    {
        maximizar_imagen_fondo(this);
    });
}

$(document).ready
        (
                function ()
                {
                    auto_ajustar_fondos_automaticos();

                    $(window).resize
                            (
                                    function ()
                                    {
                                        auto_ajustar_fondos_automaticos();
                                    }
                            );
                }
        );