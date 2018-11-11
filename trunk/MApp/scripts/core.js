
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

    var isOpen = false;
    var mw = $('#mw');
    var mwFrame = $("#mwFrame");
    var contentWindow = mwFrame[0].contentWindow;

    mwFrame.css({ width: width + 'px', height: height + 'px' });
    $('.modal-dialog').css({ width: (width + 32) + 'px', height: 'auto', 'max-height': '100%' });

    this.show = function (page) {
        mwFrame.attr("src", page);
        mw.modal('show');
    }

    this.close = function () {
        mw.modal('hide');
    }

    // events
    mw.on('hide.bs.modal', function (e) { isOpen = false; });
    mw.on('show.bs.modal', function (e) { isOpen = true; });
    //mw.on('hidden.bs.modal', function (e) { });
    //mw.on('shown.bs.modal', function (e) { });
}


$(function () {
    var tm = new Traductor();
    tm.SetUrl('Default.aspx/GetJson');

    var textos = tm.GetMap('1,2,54,8,100,6,46,65');

    tm.GetMapAsync('1,2,54,8,654,6,46,65', 'error', function (map) {
        //alert(map[65]);
    });

    var mw = new ModalWindow(1200, 720);

    $('#btnConsulta').click(function () {
        mw.show('Login.aspx?s=1&t=5&u' + Math.random());
    });
});

//uso
//tm.SetUrl('../TextManager.aspx/GetJson'); 			// por default es 'TextManager.aspx/GetJson'
//var titulos = tm.GetMap('1,68,47,217,24,1118'); 		// por default es titulos
//var errores = tm.GetMap('40,841,234,686', 'error')\