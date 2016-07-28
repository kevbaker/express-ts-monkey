/// <reference path="./_all.d.ts" />
"use strict";
var express = require("express");
var App = (function () {
    /**
     * App constructor
     */
    function App() {
        this.port = 3000;
        console.dir("Starting App");
        // setup server
        this.app = express();
        // define some routes
        this.app.get('/', function (req, res) {
            res.send('hello world');
        });
        this.app.get('/ninja', function (req, res) {
            res.send('hello ninja');
        });
        // setup port listener
        this.app.listen(this.port, '0.0.0.0', function (e) {
            if (e) {
                console.dir("App constructor error:", e);
                return;
            }
            console.dir("App listening on http://localhost:" + 3001);
        });
    }
    /**
     * Start server
     */
    App.start = function () {
        return new App();
    };
    return App;
}());
var server = App.start();
