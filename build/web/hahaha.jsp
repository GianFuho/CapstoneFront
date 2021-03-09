<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Firebase Image Upload in Javascript</title>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab&subset=latin,greek' rel='stylesheet' type='text/css'>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">

        <style>
            body{
                font-size: 30px;
            }
            .checked {
                color: orange;
            }
            .half-color {
                position: relative;
                font-size:80px;
                display:inline-block;
                color:#FFD600;
                font-family: 'Chilanka', cursive;
            }
            .half-color:before{
                content: attr(attribute);
                color:BLUE;
                position:absolute;
                top:0;
                left:0;
                height:50%;
                overflow:hidden;
            }
            h1 {
                display: inline-block;
                margin: 0;
                line-height: 1em;
                font-family: Helvetica, Arial, sans-serif;
                font-weight: bold;
                font-size: 200px;
                background: linear-gradient(to right, #1c87c9 50%, #FFD600 50%);
                background-clip: text;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }
        </style>
    </head>
    <body>  
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <br/>

        <span class="half-color" attribute="N">N</span>
        <span class="half-color" attribute="E">E</span>
        <span class="half-color" attribute="P">P</span>
        <span class="half-color" attribute="A">A</span>
        <span class="half-color" attribute="L">L</span>

        <h1>X</h1>

    </body>
    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>

    <script>
        var firebaseConfig = {
            apiKey: "AIzaSyBf5hSMUpJ-kpx5c87kgll3dXePgK-j9mQ",
            authDomain: "upload-image-45245.firebaseapp.com",
            databaseURL: "https://upload-image-45245.firebaseio.com",
            projectId: "upload-image-45245",
            storageBucket: "upload-image-45245.appspot.com",
            messagingSenderId: "758652365413",
            appId: "1:758652365413:web:f009f179396e4af4de748c",
            measurementId: "G-S5ECRSMKRB"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);


    </script>
</html>