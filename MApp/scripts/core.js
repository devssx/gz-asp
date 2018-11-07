
function Traductor(url) {
    'use strict';

    var __url = url || 'TextManager.aspx/GetJson';

    this.SetUrl = function (url) {
        __url = url;
    }

    //regresa un objeto JavaScript con todas los valores para cada id enviada como parametro. (TextManager.aspx.cs)
    this.GetMap = function (ids, type) {
        var response = $.ajax({
            type: "POST",
            url: __url,
            data: JSON.stringify({ "ids": ids, "tipo": type || 'titulo' }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false
        });

        return JSON.parse(response.responseJSON.d);
    }

    this.GetMapAsync = function (ids, type, callback) {
        $.ajax({
            type: "POST",
            url: __url,
            data: JSON.stringify({ "ids": ids, "tipo": type || 'titulo' }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                callback(JSON.parse(response.d));
            },
            error: function (xhr, ajaxOptions, thrownError) {
                callback("No se ha podido obtener la información");
            }
        });
    }
}


function ModalWindow(width, height) {

    //if (saveCallback) {
    //    document.getElementById('btnGuardarCambiosInd').onclick = function () {
    //        saveCallback($("#modalFrame")[0].contentWindow);
    //        $('#modalClose')[0].click();
    //    };
    //}
    
    $("#modalFrame").css('width', width + 'px');
    $("#modalFrame").css('height', height + 'px');

    this.show = function (page) {
        $("#modalFrame").attr("src", page);
        $('#innerModal').css({ width: (width + 40) + 'px', height: 'auto', 'max-height': '100%' });

        if (this.onclose)
            this.onclose();
    }

    this.addFx = function (eButton, callback) {
        ///TODO
        return this;
    }

    //events
    this.onclose;
}


$(function () {
    var tm = new Traductor();
    tm.SetUrl('Default.aspx/GetJson');

    var textos = tm.GetMap('1,2,54,8,100,6,46,65');

    tm.GetMapAsync('1,2,54,8,654,6,46,65', 'error', function (map) {
        alert(map[65]);
    });

    var mw = new ModalWindow(1200, 720);
    mw.onclose = function () { alert('hola'); }

    $('#btnConsulta').click(function () { mw.show('Login.aspx'); });
});

//uso
//tm.SetUrl('../TextManager.aspx/GetJson'); 			// por default es 'TextManager.aspx/GetJson'
//var titulos = tm.GetMap('1,68,47,217,24,1118'); 		// por default es titulos
//var errores = tm.GetMap('40,841,234,686', 'error')\