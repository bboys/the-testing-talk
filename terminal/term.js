var funs = [];
var lock = false;

function addCall(fun, time) {
    funs.push([fun, time, Array.prototype.slice.call(arguments, 2)]);
    doCall();
}

function doCall() {
    if (funs.length > 0 && !lock) {
        lock = true;
        setTimeout(function() {
            funs[0][0].apply(this, funs[0][2]);
            lock = false;
            funs = funs.slice(1);
            doCall();
        }, funs[0][1]);
    }
}

function putText(text) {
    var content = $('#content').html();
    content = content.substring(0, content.length - 1);
    $('#content').html(content + text + '&#x2588;');
}

function typeLine(line) {
    for (var i = 0; i < line.length; i++) {
        var text = line.charAt(i).replace(' ', '&nbsp;');
        addCall(putText, 100, text);
    }

    addCall(putText, 100, '<br/>');
}

function setStart() {
    addCall(putText, 0, '>> ');
}

function outputLines(lines) {
    for (var i = 0; i < lines.length; i++) {
        var text = lines[i].replace(new RegExp(' ', 'g'), '&nbsp;');
        text = text.replace(new RegExp('\t', 'g'), '&nbsp;&nbsp;&nbsp;&nbsp;');
        text += '<br/>';
        addCall(putText, 10, text);
    }
}

function parseUrl() {
    setStart();

    var url = $(location).attr('href');
    var splurl = url.split("?");

    if (splurl.length < 2) {
        return;
    }

    var started = true;
    splurl = splurl[1].split("&");
    for (var i = 0; i < splurl.length; i++) {
        var pair = splurl[i].split("=");
        var type = pair[0];
        var text = unescape(pair[1]);
        if (type === 'c') {
            if (!started) {
                setStart();
            }
            typeLine(text);
            started = false;
        } else if (type === 'o') {
            outputLines(text.split('\\n'));
            setStart();
            started = true;
        } else if (type === 's') {
            setStart();
            started = true;
        }
    }
}
