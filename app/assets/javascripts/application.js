// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('set-nick').addEventListener('click', function () {
        var headers = new Headers();
        var nickname = document.getElementById('nickname');
        headers.append('Accept', 'application/json'); // This one is enough for GET requests
        headers.append('Content-Type', 'application/json'); // This one sends body
        fetch('/set_nickname', {
            method: 'POST',
            headers: headers,
            mode: 'same-origin',
            credentials: 'same-origin',
            body: JSON.stringify({
                nickname: nickname.value
            })
        }).then(function (resp) {
            resp.json().then(function (resp) {
                redirectWithLocation();

            })
        })
    });

    function redirectWithLocation() {
        var url = new URL(window.location.href);
        window.location.replace(url);

    }

})

